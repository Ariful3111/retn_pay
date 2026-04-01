import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartCDescription extends StatelessWidget {
  final bool isDark;
  const ApplicationManagementDetailsPartCDescription({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text(
            'A rental provider is required by law to disclose...',
            isDark,
          ),
          SizedBox(height: 12.h),
          _text(
            'The following information is being disclosed...',
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _text(String text, bool isDark) {
    return CustomTextSecondary(
      text: text,
      fontSize: 14.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }
}
