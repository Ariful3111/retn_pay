import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.darkPrimary,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      surface: AppColors.darkBorderPrimary,
    ),
  );
}