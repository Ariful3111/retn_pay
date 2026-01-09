import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    ThemeController themeController = Get.find();
    return SizedBox(
      height: 44.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final image = categoryList[index]['image'];
          final category = categoryList[index]['category'];
          return Obx(() {
            final isSelected = homeController.selectedCategory.value == index;
            return GestureDetector(
              onTap: () {
                homeController.selectedCategory.value = index;
              },
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.only(
                  top: 2.h,
                  bottom: 2.h,
                  left: 2.w,
                  right: 8.w,
                ),
                height: 44.h,
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? AppColors.primaryColor
                      : themeController.isDarkMode.value
                      ? LinearGradient(
                          colors: [
                            AppColors.darkSecondary,
                            AppColors.darkSecondary,
                          ],
                        )
                      : LinearGradient(
                          colors: [AppColors.whiteColor, AppColors.whiteColor],
                        ),
                  borderRadius: BorderRadius.circular(12.sp),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: AppColors.darkPrimary.withValues(alpha: 0.10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(image, height: 40.h, width: 40.w),
                    SizedBox(width: 4.w),
                    CustomTextSecondary(
                      text: category,
                      fontSize: 14.sp,
                      color: isSelected
                          ? AppColors.whiteColor
                          : AppColors.secondaryTextColor,
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
