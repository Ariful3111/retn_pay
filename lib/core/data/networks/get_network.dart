import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';

class GetNetwork {
  String baseUrl = NetworkLinks.baseUrl;
  Future<Either<ErrorModel, T>> getData<T>({
    required String url,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + url), headers: headers);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return Right(fromJson(jsonDecode(response.body)));
      }

      try {
        debugPrint("Url: $url");
        return left(
          ErrorModel.fromHttp(
            statusCode: response.statusCode,
            bodyMessage:
                jsonDecode(response.body)["message"] ?? 'Unknown error',
          ),
        );
      } catch (error) {
        debugPrint("$error$url");
        return left(ErrorModel.fromUnknown());
      }
    } catch (error) {
      debugPrint("$error$url");
      return left(ErrorModel.fromUnknown());
    }
  }
}
