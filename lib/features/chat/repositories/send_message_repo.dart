import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class SendMessageRepository {
  final PostWithoutResponse postWithoutResponse;
  final ImageWithoutResponse imageWithoutResponse;
  const SendMessageRepository({
    required this.postWithoutResponse,
    required this.imageWithoutResponse,
  });

  Future<Either<ErrorModel, bool>> execute({
    required int conversationID,
    String? message,
    List<File>? images,
  }) async {
    final trimmed = (message ?? '').trim();
    final hasMessage = trimmed.isNotEmpty;
    final hasImages = (images ?? []).isNotEmpty;

    final url =
        "/api/${NetworkLinks.version}/chat/conversations/$conversationID/messages";
    final headers = {
      "Accept": "application/json",
      "Authorization":
          "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
    };

    if (!hasImages) {
      return postWithoutResponse.postData(
        url: url,
        headers: {...headers, "Content-Type": "application/json"},
        body: {"message": trimmed},
      );
    }

    final params = List.generate(images!.length, (i) => 'images[$i]').toList();

    return imageWithoutResponse.upload(
      url: url,
      images: images,
      imageParameters: params,
      fields: hasMessage ? {'message': trimmed} : null,
      headers: headers,
    );
  }
}
