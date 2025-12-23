import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';

class TimePicker{
  static Future<void> pickTime({
    required BuildContext context,
    required Function(TimeOfDay) onTimeSelected,
    TimeOfDay? initialTime,
  }) async {
    final TimeOfDay now = TimeOfDay.now();
    bool isDark = Theme.of(context).brightness== Brightness.dark;
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:isDark?ColorScheme.dark(
              brightness: Brightness.dark,
              primary: AppColors.primaryColorDark,
              surface: AppColors.darkPrimary,
              onPrimary: AppColors.whiteColor,
              secondary: AppColors.borderColor,
              
            ) :ColorScheme.light(
              primary:AppColors.primaryColorDark,
              surface: AppColors.whiteColor ,
              secondary: AppColors.borderColor,
              brightness: Brightness.light,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onTimeSelected(picked);
    }
  }
}
