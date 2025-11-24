import 'package:flutter/material.dart';

class TimePicker{
  static Future<void> pickTime({
    required BuildContext context,
    required Function(TimeOfDay) onTimeSelected,
    TimeOfDay? initialTime,
  }) async {
    final TimeOfDay now = TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              // primary: Colors.deepPurple,
              // onPrimary: Colors.white,
              // onSurface: Colors.black,
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
