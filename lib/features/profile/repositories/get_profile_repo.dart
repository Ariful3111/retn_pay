import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/global_models/profile_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';

class GetProfileRepository {
  final GetNetwork getNetwork;
  const GetProfileRepository({required this.getNetwork});

  Future<Either<ErrorModel, ProfileModel>> execute() async {
    final response = await getNetwork.getData<ProfileModel>(
      url: "/api/${NetworkLinks.version}/profile",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ProfileModel.fromJson(json),
    );
    debugPrint(
      "Token: ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
    );
    return response;
  }
}
