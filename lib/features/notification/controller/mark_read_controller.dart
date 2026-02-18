import 'package:get/get.dart';
import 'package:renter_pay/features/notification/controller/notification_controller.dart';
import 'package:renter_pay/features/notification/repositories/mark_read_notification.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class MarkReadController extends GetxController {
  final MarkReadNotificationRepository markReadNotificationRepository;
  MarkReadController({required this.markReadNotificationRepository});

  final isLoading = false.obs;

  Future<void> markRead() async {
    final notificationController = Get.find<NotificationController>();
    final items = notificationController.notifications.value?.data?.data;
    if (items == null || items.isEmpty) return;
    if (!items.any((e) => e.isRead == false)) return;
    isLoading.value = true;
    final response = await markReadNotificationRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        notificationController.markRead();
      },
    );
  }
}
