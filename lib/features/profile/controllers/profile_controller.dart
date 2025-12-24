import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class ProfileController extends GetxController {
  RxBool isWebAsset = false.obs;
  final scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  List<String> profileList = [
    'Tenant Profile',
    'Landlord Profile',
    'Agent Profile',
    'Service Vendor Profile',
  ];
  Future<void> logOut() async {
    await Get.find<StorageService>().remove(
      key: Get.find<StorageService>().tokenKey,
    );
    Get.offAllNamed(AppRoutes.userRole);
  }

  @override
  void onInit() {
    Get.find<GlobalScrollController>().listen(scrollController);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
