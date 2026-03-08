import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/controllers/p2p_chat_list_controller.dart';
import 'package:renter_pay/features/chat/repositories/p2p_chat_list_repo.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => P2PChatListRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => P2PChatListController(p2pChatListRepository: Get.find()));
  }
}
