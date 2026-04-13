import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class CategoryList extends GetView<PropertyCategoryController> {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    HomeController homeController = Get.find();
    return Obx(() {
      final selectedIndex = controller.selectedCategory.value;
      return controller.isLoading.value
          ? ButtonLoading()
          : Container(
              height: 64.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    controller.propertyCategories.value?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  String? image =
                      controller.propertyCategories.value?.data?[index].image;
                  String? category =
                      controller.propertyCategories.value?.data?[index].name;
                  final isSelected = selectedIndex == index;
                  bool isFirst = index == 0;
                  bool isLast =
                      index ==
                      controller.propertyCategories.value!.data!.length - 1;
                  return GestureDetector(
                    onTap: () async {
                      if (isSelected) {
                        controller.selectedCategory.value = -1;
                        await homeController.getProperties();
                      } else {
                        controller.selectedCategory.value = index;
                        await homeController.getProperties();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: isLast ? 8.w : 0.w,
                        top: 10.h,
                        bottom: 10.h,
                        left: isFirst ? 20.w : 10.w,
                      ),
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
                                colors: [
                                  AppColors.whiteColor,
                                  AppColors.whiteColor,
                                ],
                              ),
                        borderRadius: BorderRadius.circular(12.sp),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            color: AppColors.darkPrimary.withValues(
                              alpha: 0.10,
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 1.5.w,
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(image ?? ""),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          CustomTextSecondary(
                            text: category ?? "",
                            fontSize: 14.sp,
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.secondaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
