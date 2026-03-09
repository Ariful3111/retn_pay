import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/get_socket_token_controller.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_receive_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_send_controller.dart';
import 'package:renter_pay/features/chat/repositories/connect_websocket_repo.dart';
import 'package:renter_pay/features/chat/repositories/get_messages_repo.dart';
import 'package:renter_pay/features/chat/repositories/get_socket_token_repo.dart';
import 'package:renter_pay/features/chat/repositories/receive_websocket_event_repo.dart';
import 'package:renter_pay/features/chat/repositories/send_websocket_event_repo.dart';

class MessageBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ConnectWebsocketRepository>()) {
      Get.lazyPut(() => ConnectWebsocketRepository());
    }
    if (!Get.isRegistered<WebsocketConnectController>()) {
      Get.put(
        WebsocketConnectController(connectWebsocketRepository: Get.find()),
      );
    }

    if (!Get.isRegistered<GetSocketTokenRepository>()) {
      Get.lazyPut(() => GetSocketTokenRepository(postWithResponse: Get.find()));
    }
    if (!Get.isRegistered<GetSocketTokenController>()) {
      Get.lazyPut(
        () => GetSocketTokenController(getSocketTokenRepository: Get.find()),
      );
    }

    if (!Get.isRegistered<GetMessagesRepository>()) {
      Get.lazyPut(() => GetMessagesRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<MessageController>()) {
      Get.lazyPut(() => MessageController(getMessagesRepository: Get.find()));
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
