import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/controllers/p2p_chat_list_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_receive_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_send_controller.dart';
import 'package:renter_pay/features/chat/repositories/p2p_chat_list_repo.dart';
import 'package:renter_pay/features/chat/repositories/connect_websocket_repo.dart';
import 'package:renter_pay/features/chat/repositories/receive_websocket_event_repo.dart';
import 'package:renter_pay/features/chat/repositories/send_websocket_event_repo.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<P2PChatListRepository>()) {
      Get.lazyPut(() => P2PChatListRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<ChatController>()) {
      Get.lazyPut(() => ChatController());
    }
    if (!Get.isRegistered<P2PChatListController>()) {
      Get.lazyPut(
        () => P2PChatListController(p2pChatListRepository: Get.find()),
      );
    }
    if (!Get.isRegistered<ConnectWebsocketRepository>()) {
      Get.lazyPut(() => ConnectWebsocketRepository());
    }
    if (!Get.isRegistered<WebsocketConnectController>()) {
      Get.put(
        WebsocketConnectController(connectWebsocketRepository: Get.find()),
      );
    }

    if (!Get.isRegistered<SendWebsocketEventRepository>()) {
      Get.lazyPut(
        () => SendWebsocketEventRepository(
          websocketConnectController: Get.find<WebsocketConnectController>(),
        ),
      );
    }
    if (!Get.isRegistered<WebsocketEventSendController>()) {
      Get.lazyPut(
        () => WebsocketEventSendController(
          sendWebsocketEventRepository: Get.find(),
        ),
      );
    }
    if (!Get.isRegistered<ReceiveWebsocketEventRepository>()) {
      Get.lazyPut(() => const ReceiveWebsocketEventRepository());
    }
    if (!Get.isRegistered<WebsocketEventReceiveController>()) {
      Get.lazyPut(
        () => WebsocketEventReceiveController(
          receiveWebsocketEventRepository: Get.find(),
          websocketEventSendController: Get.find(),
        ),
      );
    }
  }
}
