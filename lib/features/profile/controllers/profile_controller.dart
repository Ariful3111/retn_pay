import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';

class ProfileController extends GetxController{
  RxBool isWebAsset = false.obs;
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
  void logOut(){
    Get.offAllNamed(AppRoutes.userRole);
  }
}