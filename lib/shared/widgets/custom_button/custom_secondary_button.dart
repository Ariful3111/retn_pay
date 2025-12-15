import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class CustomSecondaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final VoidCallback onPressed;
  final Widget? child;
  final BoxDecoration? boxDecoration;
  final double? borderWidth;
  final Color? borderColor;
  final String? text;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final FontWeight? fontWeight;
  final Color ?color;

  const CustomSecondaryButton({
    super.key,
    this.height,
    this.width,
    this.fontSize,
    required this.onPressed,
    this.child,
    this.boxDecoration,
    this.borderWidth,
    this.borderColor,
    this.text,
    this.textColor,
    this.borderRadius,
    this.fontWeight, this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration:
            boxDecoration ??
            BoxDecoration(
              color: color,
              borderRadius: borderRadius ?? BorderRadius.circular(10.r),
              border: BoxBorder.all(
                color:isDark? borderColor??AppColors.whiteColor:borderColor ?? AppColors.borderColor,
                width: borderWidth ?? 1.w,
              ),
            ),
        child:
            child ??
            Center(
              child: CustomTextPrimary(
                text: text ?? "",
                color:isDark?textColor?? AppColors.whiteColor:textColor ?? AppColors.borderColor,
                fontSize: fontSize ?? 16.sp,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
