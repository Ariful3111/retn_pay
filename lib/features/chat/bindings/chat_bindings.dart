import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/controllers/get_socket_token_controller.dart';
import 'package:renter_pay/features/chat/controllers/p2p_chat_list_controller.dart';
import 'package:renter_pay/features/chat/controllers/user_channel_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_receive_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_send_controller.dart';
import 'package:renter_pay/features/chat/repositories/p2p_chat_list_repo.dart';
import 'package:renter_pay/features/chat/repositories/connect_websocket_repo.dart';
import 'package:renter_pay/features/chat/repositories/get_socket_token_repo.dart';
import 'package:renter_pay/features/chat/repositories/receive_websocket_event_repo.dart';
import 'package:renter_pay/features/chat/repositories/send_websocket_event_repo.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';

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

    // Ensure ProfileController is available for UserChannelController
    if (!Get.isRegistered<ProfileController>()) {
      Get.lazyPut(() => ProfileController(getProfileRepository: Get.find()));
    }

    // GetSocketTokenRepository and Controller for user channel subscription
    if (!Get.isRegistered<GetSocketTokenRepository>()) {
      Get.lazyPut(() => GetSocketTokenRepository(postWithResponse: Get.find()));
    }
    if (!Get.isRegistered<GetSocketTokenController>()) {
      Get.lazyPut(
        () => GetSocketTokenController(getSocketTokenRepository: Get.find()),
      );
    }

    // UserChannelController - subscribes to chat.user.{userId} channel once
    if (!Get.isRegistered<UserChannelController>()) {
      Get.put(UserChannelController(getSocketTokenController: Get.find()));
    }
  }
}
