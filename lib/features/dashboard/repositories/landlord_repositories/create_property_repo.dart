import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';

class CreatePropertyRepository {
  final ImageWithoutResponse imageWithoutResponse;
  const CreatePropertyRepository({required this.imageWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String title,
    required String description,
    List<String> features = const [],
    required String address,
    required int propertyTypeID,
    required String city,
    required String state,
    required String postalCode,
    required String type,
    int? bedroom,
    int? bathroom,
    required String status,
    List<int> amenities = const [],
    required int isInPerson,
    required int isVirtual,
    required List<File> images,
    List<String> captions = const [],
    String? unitNUmber,
    double? rent,
    String? currency,
    int? unitBedroom,
    int? unitBathroom,
    double? unitSize,
    String? unitStatus,
    int? primaryIndex,
  }) async {
    final trimmedFeatures = features
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    final hasUnitData =
        (unitNUmber != null && unitNUmber.trim().isNotEmpty) ||
        rent != null ||
        (currency != null && currency.trim().isNotEmpty) ||
        unitBedroom != null ||
        unitBathroom != null ||
        unitSize != null ||
        (unitStatus != null && unitStatus.trim().isNotEmpty);

    final clampedPrimaryIndex = images.isEmpty
        ? 0
        : (primaryIndex ?? 0).clamp(0, images.length - 1);

    final imageList = images.asMap().entries.map((entry) {
      final index = entry.key;
      final caption = index < captions.length ? captions[index].trim() : null;
      return {
        "caption": (caption != null && caption.isNotEmpty) ? caption : null,
        "is_primary": index == clampedPrimaryIndex ? 1 : 0,
      };
    }).toList();

    final imageParameters = List.generate(
      images.length,
      (i) => 'images[$i][image]',
    );

    final fields = <String, String>{
      "title": title,
      "description": description,
      "address": address,
      "property_type_id": propertyTypeID.toString(),
      "city": city,
      "state": state,
      "postal_code": postalCode,
      "type": type,
      "status": status,
      "is_in_person_inspection_available": isInPerson.toString(),
      "is_virtual_inspection_available": isVirtual.toString(),
    };

    if (!hasUnitData) {
      if (bedroom != null) {
        fields["bedrooms"] = bedroom.toString();
      }
      if (bathroom != null) {
        fields["bathrooms"] = bathroom.toString();
      }
    }

    if (unitNUmber != null && unitNUmber.trim().isNotEmpty) {
      fields["units[0][unit_number]"] = unitNUmber.trim();
    }
    if (rent != null) {
      fields["units[0][rent_amount]"] = rent.toStringAsFixed(2);
    }
    if (currency != null && currency.trim().isNotEmpty) {
      fields["units[0][currency]"] = currency.trim();
    }
    if (unitBedroom != null) {
      fields["units[0][bedrooms]"] = unitBedroom.toString();
    }
    if (unitBathroom != null) {
      fields["units[0][bathrooms]"] = unitBathroom.toString();
    }
    if (unitSize != null) {
      fields["units[0][size]"] = unitSize.toString();
    }
    if (unitStatus != null && unitStatus.trim().isNotEmpty) {
      fields["units[0][status]"] = unitStatus.trim();
    }

    final body = <String, dynamic>{
      "features": trimmedFeatures,
      "amenities": amenities,
      "images": imageList,
    };

    final response = await imageWithoutResponse.upload(
      url: "/api/v1/properties",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      images: images,
      imageParameters: imageParameters,
      fields: fields,
      body: body,
    );
    return response;
  }
}
