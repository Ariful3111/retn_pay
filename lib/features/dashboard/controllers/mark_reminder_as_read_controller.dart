import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/reminder_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/mark_reminder_as_read_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class MarkReminderAsReadController extends GetxController {
  final MarkReminderAsReadRepository markReminderAsReadRepository;
  MarkReminderAsReadController({required this.markReminderAsReadRepository});

  RxBool isLoading = false.obs;

  Future<bool> markAsRead({required String notificationID}) async {
    if (notificationID.trim().isEmpty) {
      ErrorSnackbar.show(description: 'Invalid notification ID');
      return false;
    }

    if (isLoading.value) return false;

    isLoading.value = true;
    try {
      final response = await markReminderAsReadRepository.execute(
        notificationID: notificationID,
      );

      return response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
          return false;
        },
        (data) {
          debugPrint("Mark As Read: $notificationID");

          final reminderCtrl = Get.find<ReminderController>();
          final currentList = reminderCtrl.reminders.value?.data?.data;
          if (currentList != null) {
            currentList.removeWhere(
              (reminder) => reminder.id == notificationID,
            );
          }
          reminderCtrl.reminders.refresh();
          return true;
        },
      );
    } finally {
      isLoading.value = false;
    }
  }
}
