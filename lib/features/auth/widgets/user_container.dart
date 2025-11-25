import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UserContainer extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;
  const UserContainer({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    UserRoleController userRoleController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      bool selectedIndex = userRoleController.selectedIndex.value == index;
      return GestureDetector(
        onTap: () {
          userRoleController.selectUser(index);
        },
        child: AnimatedContainer(
          duration: Duration(microseconds: 300),
          curve: Curves.linear,
          height: 136.72.h,
          width: 170.9.w,
          decoration: BoxDecoration(
            color:isDark?AppColors.darkSecondary: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.2.r),
            border:selectedIndex
                ? Border.all(width: 1.7.w, color:isDark? AppColors.darkBorderPrimary :AppColors.borderColor)
                : null,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5.47.h),
                spreadRadius: 0,
                blurRadius: 19.14.sp,
                color: AppColors.dropShadowColor.withValues(alpha: 0.1.w),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, height: 44.43.h, width: 44.43.w),
              SizedBox(height: 10.25.h),
              CustomTextPrimary(
                text: title,
                fontSize: 14.sp,
                color:isDark?AppColors.darkPrimaryText: Color(0xFF0A0D14),
              ),
              SizedBox(height: 8.89.h),
              CustomTextSecondary(
                text: description,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color:isDark?AppColors.darkSecondaryText : Color(0xFF525866),
              ),
            ],
          ),
        ),
      );
    });
  }
}
