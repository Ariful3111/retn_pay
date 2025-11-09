import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomText {
  static Widget primaryText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize:fontSize?? 32.sp,
        fontWeight:fontWeight?? FontWeight.w600,
        color:color?? AppColors.primaryDarkTextColor,
      ),
    );
  }

  static Widget secondaryText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration ? textDecoration,
    Color ? decorationColor,
    double ? decorationThickness,
    TextDecorationStyle ? decorationStyle,
  }) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize:fontSize?? 16.sp,
        fontWeight:fontWeight?? FontWeight.w500,
        color:color?? AppColors.secondaryTextColor,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle,
      ),
    );
  }

  static Widget spanText({
    required String title,
    required String? spantext,
    Color? color,
    Color? spanColor,
    double? fontSize,
    double? spanFontSize,
    FontWeight? fontWeight,
    FontWeight? spanFontWeight,
    VoidCallback? onTap,
    double? leftPadding,
    double? rightPadding,
    double? topPadding,
    double? bottomPadding,
    TextStyle? textStyle,
    TextDecoration ? spanDecoration,
    TextDecoration ? textDecoration,
  }) {
    return RichText(
      text: TextSpan(
        text: title,
        style: GoogleFonts.inter(
          color: color ?? AppColors.primaryDarkTextColor,
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
                  color: spanColor ?? Color(0xFF59344F),
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
