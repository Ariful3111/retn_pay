import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';

class AgentDocument extends StatelessWidget {
  const AgentDocument({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextSecondary(
              text: 'Documents',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          CustomTextSecondary(text: 'License or REA Certification:'),
          SizedBox(height: 12.h),
          CustomDottedBorder(
            height: 175.h,
            width: 310.w,
            borderRadius: 12.r,
            image: AssetImage(ImagesPath.document),
          ),
          SizedBox(height: 48.h),
          CustomTextSecondary(text: 'Engagement Agreement:'),
          SizedBox(height: 12.h),
          CustomDottedBorder(
            height: 175.h,
            width: 310.w,
            borderRadius: 12.r,
            image: AssetImage(ImagesPath.document),
          ),
        ],
      ),
    );
  }
}
