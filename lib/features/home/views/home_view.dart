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

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground.withOpacity(0.5),
        child: ListView(
          controller: controller.scrollController,
          children: [
            HomeAppbar(profileController: Get.find<ProfileController>()),
            SizedBox(height: 16.h),
            HomeSearch(controller: controller),
            SizedBox(height: 10.h),
            CategoryList(),
            SizedBox(height: 10.h),
            RecommendedItems(recommendedController: Get.find()),
            PopularItems(popularController: Get.find()),
            controller.isLoading.value
                ? Center(child: ButtonLoading())
                : _buildPropertyLists(),
          ],
        ),
      );
    });
  }

  Widget _buildPropertyLists() {
    final controller = Get.find<HomeController>();
    final hasHouse = controller.houseProperties.isNotEmpty;
    final hasApartment = controller.apartmentProperties.isNotEmpty;
    final hasVila = controller.vilaProperties.isNotEmpty;
    final hasOffice = controller.officeProperties.isNotEmpty;
    final hasStudio = controller.studioProperties.isNotEmpty;

    // If no properties at all, show "No Property Available"
    if (!hasHouse && !hasApartment && !hasVila && !hasOffice && !hasStudio) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
          child: Text(
            'No Property Available',
            style: TextStyle(
              fontSize: 18.sp,
              color: Theme.of(Get.context!).brightness == Brightness.dark
                  ? AppColors.darkSecondaryText
                  : AppColors.secondaryTextColor,
            ),
          ),
        ),
      );
    }

    // Show only categories that have properties
    return Column(
      children: [
        if (hasHouse) HouseList(homeController: controller),
        if (hasApartment) ApartmentList(homeController: controller),
        if (hasVila) VilaList(homeController: controller),
        if (hasOffice) OfficeList(homeController: controller),
        if (hasStudio) StudioList(homeController: controller),
      ],
    );
  }
}
