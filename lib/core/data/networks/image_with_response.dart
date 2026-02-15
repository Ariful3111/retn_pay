// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';

class ImageWithResponse {
  Future<Either<ErrorModel, T>> upload<T>({
    required String url,
    required List<File> images,
    required List<String> imageParameters,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? body,
    Map<String, String>? fields,
    String jsonFieldName = 'body',
    Map<String, String>? headers,
    MediaType? fileContentType,
    List<String>? overrideFileNames,
  }) async {
    try {
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
          final imagePart = await http.MultipartFile.fromPath(
            imageParameters[i],
            image.path,
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
        final decoded = jsonDecode(responseBody);
        return Right(fromJson(decoded as Map<String, dynamic>));
      } else {
        return left(
          ErrorModel.fromHttp(
            statusCode: response.statusCode,
            bodyMessage: responseBody,
          ),
        );
      }
    } catch (error) {
      return left(ErrorModel.fromUnknown());
    }
  }
}
