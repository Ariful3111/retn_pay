import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return Container(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 37.5.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          CustomTextPrimary(text: 'We\'re Here to Help', fontSize: 20.sp),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: 'Choose the best way to reach us.',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          ...List.generate(supportController.contactList.length, (index) {
            final list = supportController.contactList[index];
            return Container(
              margin: EdgeInsets.only(bottom: index == 2 ? 0 : 16.h),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 28,
                    color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(list['icon'], height: 32.h, width: 32.w),
                  SizedBox(height: 12.h),
                  CustomTextPrimary(text: list['title'], fontSize: 20.sp),
                  SizedBox(height: 8.h),
                  CustomTextSecondary(
                    text: list['subTitle'],
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  if (index == 1 || index == 0)
                    CustomPrimaryButton(
                      height: 40.h,
                      width: 111.w,
                      borderRadius: BorderRadius.circular(6.r),
                      text: list['action'],
                      onPressed: list["tap"],
                    ),
                  if (index == 2)
                    GestureDetector(
                      onTap: list["tap"],
                      child: CustomTextSecondary(text: list['action']),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
