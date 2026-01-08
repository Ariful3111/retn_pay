import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/widgets/apartment_list.dart';
import 'package:renter_pay/features/home/widgets/category_list.dart';
import 'package:renter_pay/features/home/widgets/home_appbar.dart';
import 'package:renter_pay/features/home/widgets/home_search.dart';
import 'package:renter_pay/features/home/widgets/house_list.dart';
import 'package:renter_pay/features/home/widgets/office_list.dart';
import 'package:renter_pay/features/home/widgets/popular_items.dart';
import 'package:renter_pay/features/home/widgets/recommended_items.dart';
import 'package:renter_pay/features/home/widgets/studio_list.dart';
import 'package:renter_pay/features/home/widgets/vila_list.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final HomeController homeController = Get.find();
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground.withOpacity(0.5),
        child: homeController.isLoading.value
            ? Center(child: ButtonLoading())
            : ListView(
                controller: homeController.scrollController,
                children: [
                  HomeAppbar(profileController: Get.find<ProfileController>()),
                  SizedBox(height: 16.h),
                  HomeSearch(),
                  SizedBox(height: 20.h),
                  CategoryList(),
                  SizedBox(height: 24.h),
                  RecommendedItems(homeController: homeController),
                  PopularItems(homeController: homeController),
                  HouseList(homeController: homeController),
                  ApartmentList(homeController: homeController),
                  VilaList(homeController: homeController),
                  OfficeList(homeController: homeController),
                  StudioList(homeController: homeController),
                ],
              ),
      );
    });
  }
}
