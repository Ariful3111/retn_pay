package com.renter.pay

import com.renter.pay.platform.DownloadChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        DownloadChannel.register(
            messenger = flutterEngine.dartExecutor.binaryMessenger,
            context = this,
        )
    }
}
