import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/home/widgets/category_list.dart';
import 'package:renter_pay/features/home/widgets/home_appbar.dart';
import 'package:renter_pay/features/home/widgets/home_search.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    MainHomeController mainHomeController = Get.find();
    
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        gradient: themeController.isDarkMode.value
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground.withOpacity(0.5),
        child: ListView(
          controller: mainHomeController.scrollController,
          children: [
            HomeAppbar(),
            SizedBox(height: 16.h,),
            HomeSearch(),
             SizedBox(height: 20.h,),
             CategoryList(),
          ],
        ),
      );
    });
  }
}
