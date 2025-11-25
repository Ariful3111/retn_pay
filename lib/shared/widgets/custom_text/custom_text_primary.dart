import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';


class CustomTextPrimary extends StatelessWidget {
  final String text;
  final double? fontSize;
  final  FontWeight? fontWeight;
  final  Color? color;
  final TextAlign ?textAlign;
  const CustomTextPrimary({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        fontSize:fontSize?? 32.sp,
        fontWeight:fontWeight?? FontWeight.w600,
        color:isDark? color??AppColors.darkPrimaryText :color??AppColors.primaryDarkTextColor,
      ),
    );
  }
}
