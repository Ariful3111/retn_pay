import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double height;
  final double? width;
  final String? text;
  final double? fontSize;
  final VoidCallback onPressed;
  final Gradient? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final BoxDecoration? boxDecoration;
  final Widget? child;
  final FontWeight? fontWeight;

  const CustomPrimaryButton({
    super.key,
    required this.height,
    this.width,
    this.text,
    this.fontSize,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.child,
    this.boxDecoration,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width ?? MediaQuery.widthOf(context),
        decoration:
            boxDecoration ??
            BoxDecoration(
              gradient: backgroundColor ?? AppColors.primaryColor,
              borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            ),
        child:
            child ??
            Center(
              child:CustomTextPrimary(
                text: text.toString(),
                color: textColor ?? AppColors.whiteColor,
                fontSize: fontSize ?? 16.sp,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
