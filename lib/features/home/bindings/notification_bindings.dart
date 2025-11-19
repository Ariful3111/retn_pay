import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/notification_controller.dart';

class NotificationBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>NotificationController());
  }
}