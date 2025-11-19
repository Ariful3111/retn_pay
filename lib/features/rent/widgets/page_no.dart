import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class PageNo extends StatelessWidget {
  const PageNo({super.key});
  @override
  Widget build(BuildContext context) {
    RentController rentController = Get.find();
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pageButton(
            96.88.w,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconsPath.arrowLeft,
                  height: 15.31.h,
                  width: 15.31.w,
                ),
                SizedBox(width: 6.12.w),
                CustomText.primaryText(
                  text: 'Previous',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            onTap: rentController.previousPage,
          ),
          ...rentController.pageNumber.map((item) {
            if (item == '...') {
              return Container(
                height: 30.61.h,
                width: 30.61.w,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '...',
                    style: TextStyle(
                      color: AppColors.primaryDarkTextColor.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ),
              );
            }

            bool isSelect = rentController.currentPage.value == item;

            return GestureDetector(
              onTap: () {
                rentController.currentPage.value = item;
              },
              child: Container(
                height: 30.61.h,
                width: 30.61.w,
                decoration: BoxDecoration(
                  color: isSelect
                      ? AppColors.primaryTextColor
                      : Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '$item',
                    style: TextStyle(
                      color: isSelect
                          ? AppColors.whiteColor
                          : AppColors.primaryDarkTextColor.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            );
          }),
          pageButton(
            73.86.w,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText.primaryText(
                  text: 'Next',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 6.12.w),
                Image.asset(
                  IconsPath.arrowRight,
                  height: 15.31.h,
                  width: 15.31.w,
                  color: AppColors.darkPrimary,
                ),
              ],
            ),
            onTap: rentController.nextPage,
          ),
        ],
      );
    });
  }

  Widget pageButton(double width, Widget child, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33.25.h,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.12.sp),
          border: Border.all(
            width: 0.77.sp,
            color: AppColors.darkPrimary.withValues(alpha: 0.10),
          ),
        ),
        child: child,
      ),
    );
  }

}
