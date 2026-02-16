import 'package:get/get.dart';
import 'package:renter_pay/features/notification/controller/mark_read_controller.dart';
import 'package:renter_pay/features/notification/controller/notification_controller.dart';
import 'package:renter_pay/features/notification/repositories/get_notification_repo.dart';
import 'package:renter_pay/features/notification/repositories/mark_read_notification.dart';

class NotificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetNotificationRepository(getNetwork: Get.find()));
    Get.lazyPut(() => MarkReadNotificationRepository(patchNetwork: Get.find()));
    Get.lazyPut(
      () => NotificationController(getNotificationRepository: Get.find()),
    );
    Get.lazyPut(
      () => MarkReadController(markReadNotificationRepository: Get.find()),
    );
  }
}
