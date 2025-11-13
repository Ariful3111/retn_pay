import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/home/widgets/navbar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    ThemeController themeController = Get.find();
    return Obx(() {
      return Scaffold(
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.darkPrimary
            : AppColors.whiteColor,
        body: NotificationListener(
          onNotification: (notification) {
            mainHomeController.listen();
            return false;
          },
          child:
              mainHomeController.pageList[mainHomeController.selectIndex.value],
        ),
        bottomNavigationBar: AnimatedContainer(
          height: mainHomeController.isVisible.value?82.h:0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: mainHomeController.isVisible.value ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Wrap(children:[ Navbar()]),
          ),
        ),
      );
    });
  }
}
