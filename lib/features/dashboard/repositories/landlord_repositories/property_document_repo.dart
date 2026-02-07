import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';

class PropertyDocumentRepository {
  final ImageWithoutResponse imageNetwork;
  const PropertyDocumentRepository({required this.imageNetwork});

  Future<Either<ErrorModel, bool>> execute({
    required String documentType,
    required List<File> images,
    required List<String> imageParameters,
  }) async {
    final response = await imageNetwork.upload(
      url: "/api/${NetworkLinks.version}/user/documents",
      headers: {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      images: images,
      imageParameters: imageParameters,
      fields: {"document_type": documentType},
    );
    return response;
  }
}
