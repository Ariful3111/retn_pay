import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';

class AddRepairRequestRepository {
  final ImageWithoutResponse imageNetwork;
  const AddRepairRequestRepository({required this.imageNetwork});

  Future<Either<ErrorModel, bool>> execute({
    required int propertyID,
    required int unitID,
    required String title,
    required String description,
    required String urgency,
    required String preferredDate,
    String? preferredTime,
    String? otherPreferredTime,
    required List<File> images,
  }) async {
    final response = await imageNetwork.upload(
      url: "/api/${NetworkLinks.version}/maintenance/requests",
      headers: {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      imageParameters: images
          .map((e) => "images[${images.indexOf(e)}]")
          .toList(),
      images: images,
      fields: {
        "property_id": propertyID.toString(),
        "property_unit_id": unitID.toString(),
        "title": title,
        "description": description,
        "urgency": urgency,
        "preferred_date": preferredDate,
        if (preferredTime != null) "preferred_time_slots[0]": preferredTime,
        if (otherPreferredTime != null)
          "preferred_time_other": otherPreferredTime,
      },
    );
    return response;
  }
}
