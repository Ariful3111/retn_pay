import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/home/widgets/apartment_list.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/features/home/widgets/category_list.dart';
import 'package:renter_pay/features/home/widgets/home_appbar.dart';
import 'package:renter_pay/features/home/widgets/home_search.dart';
import 'package:renter_pay/features/home/widgets/house_list.dart';
import 'package:renter_pay/features/home/widgets/office_list.dart';
import 'package:renter_pay/features/home/widgets/popular_items.dart';
import 'package:renter_pay/features/home/widgets/recommended_items.dart';
import 'package:renter_pay/features/home/widgets/studio_list.dart';
import 'package:renter_pay/features/home/widgets/vila_list.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    GlobalScrollController globalScrollController = Get.find();

    return CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground.withOpacity(0.5),
        child: ListView(
          controller: globalScrollController.scrollController,
          children: [
            HomeAppbar(),
            SizedBox(height: 16.h),
            HomeSearch(),
            SizedBox(height: 20.h),
            CategoryList(),
            SizedBox(height: 24.h),
            Category(categoryName: 'Recommended', onTap: () {}),
            SizedBox(height: 16.h),
            RecommendedItems(),
            SizedBox(height: 24.h),
            Category(categoryName: 'Popular', onTap: () {}),
            SizedBox(height: 16.h),
            PopularItems(),
            SizedBox(height: 24.h),
            Category(categoryName: 'House', onTap: () {}),
            SizedBox(height: 16.h),
            HouseList(),
            SizedBox(height: 24.h),
            Category(categoryName: 'Apartment', onTap: () {}),
            SizedBox(height: 16.h),
            ApartmentList(),
            SizedBox(height: 24.h),
            Category(categoryName: 'Villa', onTap: () {}),
            SizedBox(height: 16.h),
            VilaList(),
            SizedBox(height: 24.h),
            Category(categoryName: 'Office', onTap: () {}),
            SizedBox(height: 16.h),
            OfficeList(),
            SizedBox(height: 24.h),
            Category(categoryName: 'Studio Apartment', onTap: () {}),
            StudioList(),
            SizedBox(height: 16.h),
          ],
        ),
      );
  }
}
