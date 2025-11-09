import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

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
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.2.r),
            border: selectedIndex
                ? Border.all(width: 1.7.w, color: AppColors.borderColor)
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
              CustomText.primaryText(
                text: title,
                fontSize: 14.sp,
                color: Color(0xFF0A0D14),
              ),
              SizedBox(height: 8.89.h),
              CustomText.secondaryText(
                text: description,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF525866),
              ),
            ],
          ),
        ),
      );
    });
  }
}
