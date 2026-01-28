import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/patch_without_response.dart';

class ProfileEditRepository {
  final PatchWithoutResponse patchWithoutResponse;
  const ProfileEditRepository({required this.patchWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? role,
    String? gender,
    String? phoneCode,
    String? emailCode,
    String? employmentStatus,
    String? employerName,
    String? jobTitle,
    String? monthlyIncome,
    String? agencyName,
    String? abn,
    String? reiaNumber,
    String? businessName,
    String? businessType,
    String? description,
  }) async {
    final body = <String, dynamic>{};

    void addString({required String key, String? value}) {
      final trimmed = value?.trim();
      if (trimmed != null && trimmed.isNotEmpty) {
        body[key] = trimmed;
      }
    }

    addString(key: "first_name", value: firstName);
    addString(key: "last_name", value: lastName);
    addString(key: "phone", value: phone);
    addString(key: "email", value: email);
    addString(key: "role", value: role);
    addString(key: "gender", value: gender);
    addString(key: "phone_code", value: phoneCode);
    addString(key: "email_code", value: emailCode);

    addString(key: "employment_status", value: employmentStatus);
    addString(key: "employer_name", value: employerName);
    addString(key: "job_title", value: jobTitle);
    addString(key: "monthly_income", value: monthlyIncome);

    addString(key: "agency_name", value: agencyName);
    addString(key: "abn", value: abn);
    addString(key: "reia_number", value: reiaNumber);

    addString(key: "business_name", value: businessName);
    addString(key: "business_type", value: businessType);
    addString(key: "description", value: description);

    final token =
        Get.find<StorageService>().read(
          key: Get.find<StorageService>().tokenKey,
        ) ??
        "";

    final response = await patchWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/profile",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );
    return response;
  }
}
