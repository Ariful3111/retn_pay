import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/get_socket_token_controller.dart';
import 'package:renter_pay/features/chat/controllers/mark_read_message_controller.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/controllers/send_message_controller.dart';
import 'package:renter_pay/features/chat/controllers/user_channel_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_receive_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_send_controller.dart';
import 'package:renter_pay/features/chat/repositories/connect_websocket_repo.dart';
import 'package:renter_pay/features/chat/repositories/get_messages_repo.dart';
import 'package:renter_pay/features/chat/repositories/get_socket_token_repo.dart';
import 'package:renter_pay/features/chat/repositories/mark_read_message_repo.dart';
import 'package:renter_pay/features/chat/repositories/receive_websocket_event_repo.dart';
import 'package:renter_pay/features/chat/repositories/send_message_repo.dart';
import 'package:renter_pay/features/chat/repositories/send_websocket_event_repo.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';

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

    // Ensure ProfileController is available for UserChannelController
    if (!Get.isRegistered<ProfileController>()) {
      Get.lazyPut(() => ProfileController(getProfileRepository: Get.find()));
    }

    // UserChannelController - subscribes to chat.user.{userId} channel once
    if (!Get.isRegistered<UserChannelController>()) {
      Get.put(UserChannelController(getSocketTokenController: Get.find()));
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
    if (!Get.isRegistered<SendMessageRepository>()) {
      Get.lazyPut(
        () => SendMessageRepository(
          postWithoutResponse: Get.find(),
          imageWithoutResponse: Get.find(),
        ),
      );
    }
    if (!Get.isRegistered<SendMessageController>()) {
      Get.lazyPut(
        () => SendMessageController(sendMessageRepository: Get.find()),
      );
    }
    if (!Get.isRegistered<MarkReadMessageRepository>()) {
      Get.lazyPut(
        () => MarkReadMessageRepository(postWithoutResponse: Get.find()),
      );
    }
    if (!Get.isRegistered<MarkReadMessageController>()) {
      Get.lazyPut(
        () => MarkReadMessageController(markReadMessageRepository: Get.find()),
      );
    }
  }
}
