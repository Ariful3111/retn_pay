import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class CreateInspectionRepository {
  final PostWithoutResponse postWithoutResponse;
  const CreateInspectionRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int propertyID,
    required String type,
    required String inspectionDate,
  }) async {
    debugPrint(
      "propertyID: $propertyID, type: $type, inspectionDate: $inspectionDate",
    );
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/inspections",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {
        "property_id": propertyID,
        "type": type,
        "inspection_date": inspectionDate,
      },
    );
    return response;
  }
}
