import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BenefitsList extends StatelessWidget {
  final String? image;
  final String listText;
  final double? fontSize;
  const BenefitsList({super.key, this.image, required this.listText, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(IconsPath.element, height: 17.h, width: 17.w),
        SizedBox(width: 8.w),
        CustomTextSecondary(
          text: listText,
          color: AppColors.subsPlanSubtitle,
          fontSize: fontSize ?? 16.sp,
        ),
      ],
    );
  }
}
