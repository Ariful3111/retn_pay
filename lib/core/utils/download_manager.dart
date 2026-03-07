import 'dart:io';

import 'package:flutter/services.dart';
import 'package:external_path/external_path.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DownloadResult {
  final String path;
  final String fileName;

  const DownloadResult({required this.path, required this.fileName});
}

class DownloadManager {
  static const MethodChannel _channel = MethodChannel(
    'com.renter.pay/download_manager',
  );

  static Future<DownloadResult> download({
    required String url,
    String? fileName,
    void Function(int receivedBytes, int? totalBytes)? onProgress,
  }) async {
    final uri = Uri.parse(url);
    final resolvedFileName = _resolveFileName(
      uri: uri,
      fileName: fileName,
      contentType: null,
    );

    if (Platform.isAndroid) {
      final result = await _channel.invokeMapMethod<String, dynamic>(
        'downloadToDownloads',
        <String, dynamic>{
          'url': url,
          'fileName': resolvedFileName,
          'mimeType': null,
        },
      );
      final localUri = result?['localUri']?.toString() ?? '';
      final returnedFileName =
          result?['fileName']?.toString() ?? resolvedFileName;
      return DownloadResult(path: localUri, fileName: returnedFileName);
    }

    final client = http.Client();
    try {
      final request = http.Request('GET', uri);
      final streamed = await client.send(request);
      if (streamed.statusCode < 200 || streamed.statusCode >= 300) {
        throw HttpException(
          'Download failed with status code ${streamed.statusCode}',
          uri: uri,
        );
      }

      final resolvedFileNameWithType = _resolveFileName(
        uri: uri,
        fileName: resolvedFileName,
        contentType: streamed.headers['content-type'],
      );

      final directory = await _resolveDownloadDirectory();
      await directory.create(recursive: true);
      final outFile = await _uniqueFile(
        directory: directory,
        fileName: resolvedFileNameWithType,
      );

      final sink = outFile.openWrite();
      try {
        var received = 0;
        final contentLength = streamed.contentLength;
        final total = (contentLength != null && contentLength > 0)
            ? contentLength
            : null;
        await for (final chunk in streamed.stream) {
          received += chunk.length;
          sink.add(chunk);
          onProgress?.call(received, total);
        }
      } finally {
        await sink.flush();
        await sink.close();
      }

      return DownloadResult(
        path: outFile.path,
        fileName: outFile.uri.pathSegments.last,
      );
    } finally {
      client.close();
    }
  }

  static Future<Directory> _resolveDownloadDirectory() async {
    if (Platform.isAndroid) {
      try {
        final downloadsPath =
            await ExternalPath.getExternalStoragePublicDirectory('Download');
        final dir = Directory(downloadsPath);
        await dir.create(recursive: true);
        return dir;
      } catch (_) {
        final base = await getExternalStorageDirectory();
        final dir = Directory(
          '${base?.path ?? (await getTemporaryDirectory()).path}/Download',
        );
        await dir.create(recursive: true);
        return dir;
      }
    }

    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/Downloads');
    await dir.create(recursive: true);
    return dir;
  }

  static String _resolveFileName({
    required Uri uri,
    String? fileName,
    String? contentType,
  }) {
    var name = (fileName ?? '').trim();
    if (name.isEmpty) {
      name = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
    }
    if (name.isEmpty) {
      name = 'download_${DateTime.now().millisecondsSinceEpoch}';
    }

    if (!_hasExtension(name)) {
      final ext = _extensionFromContentType(contentType);
      if (ext.isNotEmpty) {
        name = '$name$ext';
      }
    }
    return name;
  }

  static bool _hasExtension(String fileName) {
    final lastDot = fileName.lastIndexOf('.');
    return lastDot > 0 && lastDot < fileName.length - 1;
  }

  static String _extensionFromContentType(String? contentType) {
    final ct = (contentType ?? '').toLowerCase().split(';').first.trim();
    switch (ct) {
      case 'image/jpeg':
        return '.jpg';
      case 'image/png':
        return '.png';
      case 'image/gif':
        return '.gif';
      case 'application/pdf':
        return '.pdf';
      case 'text/plain':
        return '.txt';
      case 'application/zip':
        return '.zip';
      case 'application/json':
        return '.json';
      default:
        return '';
    }
  }

  static Future<File> _uniqueFile({
    required Directory directory,
    required String fileName,
  }) async {
    final baseName = _baseName(fileName);
    final ext = _extName(fileName);

    var candidate = File('${directory.path}/$fileName');
    if (!await candidate.exists()) return candidate;

    for (var i = 1; i < 10_000; i++) {
      final next = File('${directory.path}/$baseName ($i)$ext');
      if (!await next.exists()) return next;
    }
    return File(
      '${directory.path}/$baseName (${DateTime.now().millisecondsSinceEpoch})$ext',
    );
  }

  static String _baseName(String fileName) {
    final dot = fileName.lastIndexOf('.');
    if (dot <= 0) return fileName;
    return fileName.substring(0, dot);
  }

  static String _extName(String fileName) {
    final dot = fileName.lastIndexOf('.');
    if (dot <= 0) return '';
    return fileName.substring(dot);
  }
}
