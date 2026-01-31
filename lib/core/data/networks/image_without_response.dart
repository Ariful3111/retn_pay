// data/networks/image_without_response.dart
// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use, depend_on_referenced_packages, unused_local_variable
import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';

class ImageWithoutResponse {
  Future<Either<ErrorModel, bool>> upload({
    required String url,
    required List<File> images,
    required List<String> imageParameters,
    Map<String, dynamic>? body,
    Map<String, String>? fields,
    String jsonFieldName = 'body',
    Map<String, String>? headers,
    MediaType? fileContentType,
    List<String>? overrideFileNames,
  }) async {
    final uri = Uri.parse("${NetworkLinks.baseUrl}$url");
    final request = http.MultipartRequest('POST', uri);

    if (headers != null && headers.isNotEmpty) {
      request.headers.addAll(headers);
    }

    if (fields != null && fields.isNotEmpty) {
      request.fields.addAll(fields);
    }

    for (int i = 0; i < images.length; i++) {
      if (i < imageParameters.length) {
        final image = images[i];
        final stream = http.ByteStream(
          DelegatingStream.typed(image.openRead()),
        );
        final length = await image.length();
        final imagePart = http.MultipartFile(
          imageParameters[i],
          stream,
          length,
          filename: overrideFileNames != null && i < overrideFileNames.length
              ? overrideFileNames[i]
              : basename(image.path),
          contentType: fileContentType,
        );
        request.files.add(imagePart);
      }
    }

    if (body != null && body.isNotEmpty) {
      final jsonString = jsonEncode(body);
      final jsonPart = http.MultipartFile.fromString(
        jsonFieldName,
        jsonString,
        contentType: MediaType('application', 'json'),
        filename: 'payload.json',
      );
      request.files.add(jsonPart);
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(true);
    } else {
      return left(
        ErrorModel.fromHttp(
          statusCode: response.statusCode,
          bodyMessage: responseBody,
        ),
      );
    }
  }
}
