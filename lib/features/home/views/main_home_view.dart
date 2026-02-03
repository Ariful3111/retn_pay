import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/home/widgets/navbar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    GlobalScrollController globalScrollController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return Scaffold(
        backgroundColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final pixel = notification.metrics.pixels;
            if (pixel <= 200) {
              globalScrollController.isVisible.value = true;
              return false;
            }

            if (notification is ScrollUpdateNotification) {
              final delta = notification.scrollDelta ?? 0.0;
              if (delta > 0) {
                globalScrollController.isVisible.value = false;
              } else if (delta < 0) {
                globalScrollController.isVisible.value = true;
              }
              return false;
            }

            if (notification is UserScrollNotification) {
              if (notification.direction == ScrollDirection.reverse) {
                globalScrollController.isVisible.value = false;
              } else if (notification.direction == ScrollDirection.forward) {
                globalScrollController.isVisible.value = true;
              }
              return false;
            }
            return false;
          },
          child:
              mainHomeController.pageList[mainHomeController.selectIndex.value],
        ),
        bottomNavigationBar: AnimatedContainer(
          height: globalScrollController.isVisible.value ? 90.h : 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: globalScrollController.isVisible.value ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Wrap(children: [Navbar()]),
          ),
        ),
      );
    });
  }
}
