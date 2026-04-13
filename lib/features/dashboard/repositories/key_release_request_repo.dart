import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class KeyReleaseItem {
  final File keyImage;
  final String roomDoorName;
  final String releaseDate;

  KeyReleaseItem({
    required this.keyImage,
    required this.roomDoorName,
    required this.releaseDate,
  });
}

class KeyReleaseRequestRepository {
  final ImageWithoutResponse imageNetwork;
  final PostWithoutResponse postNetwork;
  const KeyReleaseRequestRepository({
    required this.imageNetwork,
    required this.postNetwork,
  });

  Future<Either<ErrorModel, bool>> submitTenantSignature({
    required int leaseAgreementId,
    required File residentSignatureImage,
    required String residentSignatureType,
  }) async {
    final response = await imageNetwork.upload(
      url: "/api/${NetworkLinks.version}/key-release-forms",
      headers: {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      imageParameters: ["resident_signature"],
      images: [residentSignatureImage],
      fields: {
        "lease_agreement_id": leaseAgreementId.toString(),
        "resident_signature_type": residentSignatureType,
      },
    );
    return response;
  }

  // Tenant: Use this when signature is already a base64 string
  Future<Either<ErrorModel, bool>> submitTenantSignatureBase64({
    required int leaseAgreementId,
    required String residentSignatureBase64,
    required String residentSignatureType,
  }) async {
    final response = await postNetwork.postData(
      url: "/api/${NetworkLinks.version}/key-release-forms",
      body: {
        "lease_agreement_id": leaseAgreementId,
        "resident_signature": residentSignatureBase64,
        "resident_signature_type": residentSignatureType,
      },
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
    );
    return response;
  }

  // Landlord: Sends everything except resident_signature and resident_signature_type
  Future<Either<ErrorModel, bool>> submitLandlordKeyRelease({
    required int leaseAgreementId,
    required String residentFirstName,
    required String residentLastName,
    required String landlordAgentSignature,
    required String landlordAgentSignatureType,
    required String releaseDate,
    required List<KeyReleaseItem> items,
  }) async {
    final fields = <String, String>{
      "lease_agreement_id": leaseAgreementId.toString(),
      "resident_first_name": residentFirstName,
      "resident_last_name": residentLastName,
      "landlord_agent_signature": landlordAgentSignature,
      "landlord_agent_signature_type": landlordAgentSignatureType,
      "release_date": releaseDate,
    };

    // Add items fields with array notation
    for (int i = 0; i < items.length; i++) {
      fields["items[$i][room_door_name]"] = items[i].roomDoorName;
      fields["items[$i][release_date]"] = items[i].releaseDate;
    }

    // Prepare images with array notation
    final imageParameters = <String>[];
    final images = <File>[];
    for (int i = 0; i < items.length; i++) {
      imageParameters.add("items[$i][key_image]");
      images.add(items[i].keyImage);
    }

    final response = await imageNetwork.upload(
      url: "/api/${NetworkLinks.version}/key-release-forms",
      headers: {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      imageParameters: imageParameters,
      images: images,
      fields: fields,
    );

    return response;
  }
}
