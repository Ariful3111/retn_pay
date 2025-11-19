import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryTextColor,
      foregroundColor: AppColors.primaryBorder,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColorDark,
      surface: AppColors.primaryTextColor,
    ),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: AppColors.darkPrimary,
    primaryColor: AppColors.darkPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.darkSecondary,
      elevation: 0,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      surface: AppColors.darkBorderPrimary,
    ),
  );
}