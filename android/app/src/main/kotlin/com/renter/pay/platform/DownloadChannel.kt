package com.renter.pay.platform

import android.app.DownloadManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.database.Cursor
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import java.net.URLConnection
import java.util.concurrent.atomic.AtomicBoolean

object DownloadChannel {
    private const val channelName = "com.renter.pay/download_manager"

    fun register(messenger: BinaryMessenger, context: Context) {
        val mainHandler = Handler(Looper.getMainLooper())
        MethodChannel(messenger, channelName).setMethodCallHandler { call, result ->
            when (call.method) {
                "downloadToDownloads" -> {
                    val url = call.argument<String>("url")
                    val fileName = call.argument<String>("fileName")
                    val mimeType = call.argument<String>("mimeType")

                    if (url.isNullOrBlank() || fileName.isNullOrBlank()) {
                        result.error("INVALID_ARGS", "url and fileName are required", null)
                        return@setMethodCallHandler
                    }

                    downloadToDownloads(
                        context = context.applicationContext,
                        url = url,
                        fileName = fileName,
                        mimeType = mimeType,
                        onSuccess = { localUri ->
                            mainHandler.post {
                                result.success(
                                    mapOf(
                                        "localUri" to localUri,
                                        "fileName" to fileName,
                                    ),
                                )
                            }
                        },
                        onError = { message ->
                            mainHandler.post {
                                result.error("DOWNLOAD_FAILED", message, null)
                            }
                        },
                    )
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun downloadToDownloads(
        context: Context,
        url: String,
        fileName: String,
        mimeType: String?,
        onSuccess: (String) -> Unit,
        onError: (String) -> Unit,
    ) {
        val appContext = context.applicationContext
        val request = DownloadManager.Request(Uri.parse(url))
            .setTitle(fileName)
            .setDescription(fileName)
            .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
            .setAllowedOverMetered(true)
            .setAllowedOverRoaming(true)
            .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName)

        val resolvedMime = mimeType?.takeIf { it.isNotBlank() }
            ?: URLConnection.guessContentTypeFromName(fileName)
        if (!resolvedMime.isNullOrBlank()) {
            request.setMimeType(resolvedMime)
        }

        val dm = appContext.getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
        val downloadId = try {
            dm.enqueue(request)
        } catch (e: Exception) {
            onError(e.message ?: "Failed to enqueue download")
            return
        }

        val completed = AtomicBoolean(false)
        val receiver = object : BroadcastReceiver() {
            override fun onReceive(ctx: Context, intent: Intent) {
                val id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1L)
                if (id != downloadId || completed.getAndSet(true)) return

                try {
                    appContext.unregisterReceiver(this)
                } catch (_: Exception) {
                }

                val query = DownloadManager.Query().setFilterById(downloadId)
                val cursor: Cursor? = try {
                    dm.query(query)
                } catch (e: Exception) {
                    onError(e.message ?: "Failed to query download status")
                    return
                }

                cursor?.use {
                    if (!it.moveToFirst()) {
                        onError("Download not found")
                        return
                    }

                    val statusIndex = it.getColumnIndex(DownloadManager.COLUMN_STATUS)
                    val localUriIndex = it.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI)
                    val reasonIndex = it.getColumnIndex(DownloadManager.COLUMN_REASON)

                    val status = if (statusIndex >= 0) it.getInt(statusIndex) else DownloadManager.STATUS_FAILED
                    when (status) {
                        DownloadManager.STATUS_SUCCESSFUL -> {
                            val localUri = if (localUriIndex >= 0) it.getString(localUriIndex) else null
                            if (localUri.isNullOrBlank()) {
                                onError("Download completed but localUri is empty")
                            } else {
                                onSuccess(localUri)
                            }
                        }

                        DownloadManager.STATUS_FAILED -> {
                            val reason = if (reasonIndex >= 0) it.getInt(reasonIndex) else -1
                            onError("Download failed (reason=$reason)")
                        }

                        else -> {
                            onError("Download ended in unexpected status: $status")
                        }
                    }
                }
            }
        }

        val filter = IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE)
        if (Build.VERSION.SDK_INT >= 33) {
            appContext.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            @Suppress("DEPRECATION")
            appContext.registerReceiver(receiver, filter)
        }

        Thread {
            val timeoutMs = 5 * 60 * 1000L
            val startMs = System.currentTimeMillis()
            while (!completed.get() && System.currentTimeMillis() - startMs < timeoutMs) {
                try {
                    val query = DownloadManager.Query().setFilterById(downloadId)
                    dm.query(query)?.use { c ->
                        if (c.moveToFirst()) {
                            val statusIndex = c.getColumnIndex(DownloadManager.COLUMN_STATUS)
                            val localUriIndex = c.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI)
                            val reasonIndex = c.getColumnIndex(DownloadManager.COLUMN_REASON)
                            val status =
                                if (statusIndex >= 0) c.getInt(statusIndex) else DownloadManager.STATUS_FAILED
                            when (status) {
                                DownloadManager.STATUS_SUCCESSFUL -> {
                                    val localUri =
                                        if (localUriIndex >= 0) c.getString(localUriIndex) else null
                                    if (!completed.getAndSet(true)) {
                                        try {
                                            appContext.unregisterReceiver(receiver)
                                        } catch (_: Exception) {
                                        }
                                        if (localUri.isNullOrBlank()) {
                                            onError("Download completed but localUri is empty")
                                        } else {
                                            onSuccess(localUri)
                                        }
                                    }
                                    return@Thread
                                }

                                DownloadManager.STATUS_FAILED -> {
                                    val reason = if (reasonIndex >= 0) c.getInt(reasonIndex) else -1
                                    if (!completed.getAndSet(true)) {
                                        try {
                                            appContext.unregisterReceiver(receiver)
                                        } catch (_: Exception) {
                                        }
                                        onError("Download failed (reason=$reason)")
                                    }
                                    return@Thread
                                }
                            }
                        }
                    }
                } catch (_: Exception) {
                }
                try {
                    Thread.sleep(500)
                } catch (_: Exception) {
                }
            }

            if (!completed.getAndSet(true)) {
                try {
                    appContext.unregisterReceiver(receiver)
                } catch (_: Exception) {
                }
                onError("Download timed out")
            }
        }.start()
    }
}
