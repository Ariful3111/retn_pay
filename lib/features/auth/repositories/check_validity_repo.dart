import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/auth/models/check_validity_model.dart';

class CheckValidityRepository {
  final PostWithResponse postWithResponse;
  const CheckValidityRepository({required this.postWithResponse});

  Future<Either<ErrorModel, CheckValidityModel>> execute({
    required String contact,
    required String code,
  }) async {
    final response = await postWithResponse.postData<CheckValidityModel>(
      url: "/api/${NetworkLinks.version}/verify-otp",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: {"contact": contact, "code": code},
      fromJson: (json) => CheckValidityModel.fromJson(json),
    );
    return response;
  }
}
