import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';

class DatePicker {
  static Future<void> pickDate({
    required BuildContext context,
    required Function(DateTime) onDateSelected,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime today = DateTime.now();
    bool isDark = Theme.of(context).brightness== Brightness.dark;
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:isDark?ColorScheme.dark(
              brightness: Brightness.dark,
              primary: AppColors.primaryColorDark,
              surface: AppColors.darkPrimary,
              onPrimary: AppColors.whiteColor,
              secondary: AppColors.darkSecondary,
            ) :ColorScheme.light(
              primary:AppColors.primaryColorDark,
              surface: AppColors.whiteColor,
              brightness: Brightness.light,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: initialDate ?? today,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
