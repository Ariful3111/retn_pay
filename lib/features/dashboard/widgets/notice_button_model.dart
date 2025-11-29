import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class NoticeButtonModel extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final String icon;
  final String text;
  final double ?blur;
  final Offset ?offset;
  const NoticeButtonModel({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.icon,
    required this.text, this.blur, this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.secondaryBorder, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonShadowColor.withValues(alpha: 0.10),
              blurRadius:blur?? 2,
              offset:offset?? Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 20.w, height: 20.h),
            SizedBox(width: 4.w),
            CustomTextSecondary(
              text: text,
              fontSize: 14.sp,
              color: Color(0xFF1D1E25),
            ),
          ],
        ),
      ),
    );
  }
}
