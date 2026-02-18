import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';

class AddSupportTicketRepository {
  final ImageWithoutResponse imageWithoutResponse;
  const AddSupportTicketRepository({required this.imageWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required List<File> images,
    required String subject,
    required String description,
    required String priority,
    required String category,
  }) async {
    final response = await imageWithoutResponse.upload(
      url: "/api/${NetworkLinks.version}/support-tickets",
      headers: {
        "Content-Type": "multipart/form-data",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      images: images,
      imageParameters: List.generate(
        images.length,
        (index) => 'images[$index]',
      ),
      fields: {
        "subject": subject,
        "description": description,
        "priority": priority,
        "category": category,
      },
    );
    return response;
  }
}
