import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyOwnerDocumentUpload extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const PropertyOwnerDocumentUpload({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(20.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark
            ? AppColors.darkSecondary
            : AppColors.darkAppBar.withValues(alpha: 0.5),
      ),
      child: Column(
        children: [
          child,
          SizedBox(height: 12.h),
          CustomPrimaryButton(
            height: 37.h,
            width: 99.w,
            borderRadius: BorderRadius.circular(8.r),
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconsPath.upload,
                  height: 18.w,
                  width: 18.w,
                  color: AppColors.darkAppBar,
                ),
                SizedBox(width: 6.w),
                CustomTextSecondary(
                  text: 'Upload',
                  fontSize: 14.sp,
                  color: AppColors.darkAppBar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
