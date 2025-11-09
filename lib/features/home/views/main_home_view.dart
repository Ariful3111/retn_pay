import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/home/widgets/navbar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    return Obx(() {
      return Scaffold(
        body: mainHomeController.pageList[mainHomeController.selectIndex.value],
        bottomNavigationBar: Navbar(),
      );
    });
  }
}
