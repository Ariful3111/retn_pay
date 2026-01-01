import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class VerificationRepository {
  final PostWithoutResponse postWithoutResponse;
  const VerificationRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String contact,
    required String contactType,
    required int isRegistration,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/send-verification-code",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: {
        "contact": contact,
        "contact_type": contactType,
        "is_registration": isRegistration,
      },
    );
    return response;
  }
}
