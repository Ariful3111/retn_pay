import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomDottedBorder extends StatelessWidget {
  final ImageProvider<Object> image;
  final double? height;
  final double? width;
  final double? borderRadius;
  const CustomDottedBorder({
    super.key,
    required this.image,
    this.height,
    this.width, this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(20.sp),
        borderPadding: EdgeInsets.all(1.r),
        color: AppColors.lightBorder,
        dashPattern: [3, 3],
      ),
      child: Container(
        height: height ?? 225.h,
        width: width ?? 350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius?? 20.sp),
          image: DecorationImage(image: image, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
