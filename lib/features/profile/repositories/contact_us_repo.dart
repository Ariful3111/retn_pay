import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class ContactUsRepository {
  final PostWithoutResponse postWithoutResponse;
  const ContactUsRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/contact",
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {
        "name": name,
        "email": email,
        "phone": phone,
        "subject": subject,
        "message": message,
      },
    );
    return response;
  }
}
