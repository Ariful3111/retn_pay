import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => MessageController());
  }
}
