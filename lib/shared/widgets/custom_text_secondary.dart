import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomTextSecondary extends StatelessWidget {
  final String text;
  final double ? fontSize;
  final  FontWeight? fontWeight;
  final  Color? color;
  final  TextDecoration ? textDecoration;
  final  Color ? decorationColor;
  final  double ? decorationThickness;
  final  TextDecorationStyle ? decorationStyle;
  const CustomTextSecondary({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textDecoration, this.decorationColor, this.decorationThickness, this.decorationStyle});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize:fontSize?? 16.sp,
        fontWeight:fontWeight?? FontWeight.w500,
        color:isDark? color??AppColors.darkSecondaryText : color??AppColors.secondaryTextColor,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle,
      ),
    );
  }
}