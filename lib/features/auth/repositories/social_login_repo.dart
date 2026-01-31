import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/auth/models/social_login_model.dart';

class SocialLoginRepository {
  final PostWithResponse postNetwork;
  const SocialLoginRepository({required this.postNetwork});

  Future<Either<ErrorModel, SocialLoginModel>> execute({
    required String provider,
    required String token,
    required String role,
  }) async {
    debugPrint("Social Login Request: $provider, $role");
    final response = await postNetwork.postData<SocialLoginModel>(
      url: "/api/${NetworkLinks.version}/auth/social",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      fromJson: (json) => SocialLoginModel.fromJson(json),
      body: {"provider": provider, "role": role, "access_token": token},
    );
    return response;
  }
}
