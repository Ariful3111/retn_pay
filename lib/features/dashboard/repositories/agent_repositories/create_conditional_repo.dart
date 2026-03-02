import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';

class CreateConditionalReportRepository {
  final ImageWithoutResponse imageWithoutResponse;
  const CreateConditionalReportRepository({required this.imageWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String propertyID,
    required String reportType,
    required String summary,
    required File image,
  }) async {
    final response = await imageWithoutResponse.upload(
      url: "/api/${NetworkLinks.version}/condition-reports",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      images: [image],
      imageParameters: ["file"],
      fields: {
        "property_id": propertyID,
        "report_type": reportType,
        "summary": summary,
      },
    );
    return response;
  }
}
