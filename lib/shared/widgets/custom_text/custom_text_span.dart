import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomTextSpan extends StatelessWidget {
    final String title;
    final String spantext;
    final Color? color;
    final Color? spanColor;
    final double? fontSize;
    final double? spanFontSize;
    final FontWeight? fontWeight;
    final FontWeight? spanFontWeight;
    final VoidCallback? onTap;
    final double? leftPadding;
    final double? rightPadding;
    final double? topPadding;
    final double? bottomPadding;
    final TextStyle? textStyle;
    final TextDecoration ? spanDecoration;
    final TextDecoration ? textDecoration;
    final TextAlign ? textAlign;
  const CustomTextSpan({super.key, required this.title,required this.spantext, this.color, this.spanColor, this.fontSize, this.spanFontSize, this.fontWeight, this.spanFontWeight, this.onTap, this.leftPadding, this.rightPadding, this.topPadding, this.bottomPadding, this.textStyle, this.spanDecoration, this.textDecoration, this.textAlign});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return RichText(
      textAlign: textAlign??TextAlign.start,
      text: TextSpan(
        text: title,
        style: GoogleFonts.inter(
          color:isDark? color ??AppColors.darkPrimaryText :color??AppColors.primaryDarkTextColor,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: textDecoration,
        ),
        children: [
          TextSpan(
            text: spantext,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style:
                textStyle ??
                GoogleFonts.inter(
                  color:isDark? spanColor??Color(0xFFBB8CA9): spanColor ??Color(0xFF59344F),
                  fontSize: spanFontSize ?? 14.sp,
                  fontWeight: spanFontWeight ?? FontWeight.w500,
                  decoration: spanDecoration,
                ),
          ),
        ],
      ),
    );
  }
}