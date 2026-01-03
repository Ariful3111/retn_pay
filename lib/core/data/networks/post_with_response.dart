import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';

class PostWithResponse {
  String baseUrl = NetworkLinks.baseUrl;
  Future<Either<ErrorModel, T>> postData<T>({
    required String url,
    required Map body,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, String> headers,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + url),
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return Right(fromJson(jsonDecode(response.body)));
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
