import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class RequestSubmit extends StatelessWidget {
  const RequestSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      height: 57.h,
      width: 380.w,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.54),
            blurRadius: 17.79,
            color: AppColors.dropShadowColor.withValues(alpha: 0.10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextSpan(
            title: 'By continuing you agree to our ',
            spantext: 'Main Terms.',
            fontSize: 10.sp,
            spanFontSize: 10.sp,
            fontWeight: FontWeight.w400,
            spanFontWeight: FontWeight.w400,
            color: Color(0xFF6F6F6F),
            spanColor: Color(0xFF1680FB),
          ),
          CustomPrimaryButton(
            height: 37.h,
            width: 112.w,
            text: 'Submit Now',
            fontSize: 14.sp,
            onPressed: () {
              Navigator.pop(context);
              Get.toNamed(AppRoutes.repairRequestView);
            },
          ),
        ],
      ),
    );
  }
}
