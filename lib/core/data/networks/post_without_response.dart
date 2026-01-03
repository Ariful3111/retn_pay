import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';

class PostWithoutResponse {
  String baseUrl = NetworkLinks.baseUrl;

  Future<Either<ErrorModel, bool>> postData({
    required String url,
    required Map body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.post(
        headers: headers ?? {},
        Uri.parse(baseUrl + url),
        body: jsonEncode(body),
      );
      debugPrint(response.body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return Right(true);
      }
      try {
        return left(
          ErrorModel.fromHttp(
            statusCode: response.statusCode,
            bodyMessage:
                jsonDecode(response.body)["message"] ?? 'Unknown error',
          ),
        );
      } catch (error) {
        return left(ErrorModel.fromUnknown());
      }
    } catch (error) {
      return left(error as ErrorModel);
    }
  }
}
