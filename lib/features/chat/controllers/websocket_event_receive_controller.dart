import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/unread_count_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_send_controller.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/models/message_list_model.dart';
import 'package:renter_pay/features/chat/models/websocket_connection_model.dart';
import 'package:renter_pay/features/chat/repositories/receive_websocket_event_repo.dart';

class WebsocketEventReceiveController extends GetxController {
  final ReceiveWebsocketEventRepository receiveWebsocketEventRepository;
  final WebsocketEventSendController websocketEventSendController;
  WebsocketEventReceiveController({
    required this.receiveWebsocketEventRepository,
    required this.websocketEventSendController,
  });

  final lastEvent = RxnString();
  final lastRaw = RxnString();
  final lastData = Rxn<dynamic>();

  Future<void> onRaw(dynamic raw) async {
    final parsed = receiveWebsocketEventRepository.parse(raw);
    await parsed.fold((_) async {}, (msg) async => onMessage(msg));
  }

  Future<void> onMessage(WebSocketConnectionMessage msg) async {
    lastEvent.value = msg.event;
    lastData.value = msg.data;
    try {
      lastRaw.value = msg.data?.toString();
    } catch (_) {
      lastRaw.value = null;
    }

    if (msg.event == 'message.sent') {
      final raw = msg.data;
      Map<String, dynamic>? decoded;
      if (raw is String) {
        try {
          final parsed = jsonDecode(raw);
          if (parsed is Map) {
            decoded = parsed.map((k, v) => MapEntry(k.toString(), v));
          }
        } catch (_) {}
      } else if (raw is Map) {
        decoded = raw.map((k, v) => MapEntry(k.toString(), v));
      }
      if (decoded != null) {
        final item = MessageItem.fromJson(decoded);
        final isSentByMe = item.isSentByMe == true;
        final conversationId = item.chatConversationId;
        final currentCid = Get.isRegistered<MessageController>()
            ? Get.find<MessageController>().currentConversationId.value
            : null;

        // Add message to list if viewing that conversation
        if (Get.isRegistered<MessageController>() &&
            conversationId == currentCid) {
          Get.find<MessageController>().addIncomingMessage(item);
        } else if (!isSentByMe && Get.isRegistered<UnreadCountController>()) {
          // Increment unread count only if not sent by me and not viewing that conversation
          Get.find<UnreadCountController>().incrementUnread(conversationId);
        }
      }
      return;
    }

    if (msg.event == 'messages.read') {
      final raw = msg.data;
      debugPrint('messages.read event received: $raw');
      Map<String, dynamic>? decoded;
      if (raw is String) {
        try {
          final parsed = jsonDecode(raw);
          if (parsed is Map) {
            decoded = parsed.map((k, v) => MapEntry(k.toString(), v));
          }
        } catch (_) {}
      } else if (raw is Map) {
        decoded = raw.map((k, v) => MapEntry(k.toString(), v));
      }
      if (decoded != null) {
        final conversationId = decoded['chat_conversation_id'];
        final readAt = decoded['read_at']?.toString();
        if (Get.isRegistered<MessageController>()) {
          Get.find<MessageController>().handleMessagesRead(
            conversationId: conversationId,
            readAt: readAt,
          );
        }
        // Clear unread count for this conversation
        if (Get.isRegistered<UnreadCountController>()) {
          Get.find<UnreadCountController>().clearConversationUnread(
            conversationId is int
                ? conversationId
                : int.tryParse(conversationId?.toString() ?? ''),
          );
        }
      }
      return;
    }

    if (msg.event == 'pusher:ping') {
      debugPrint('pusher:ping received');
      await websocketEventSendController.sendEvent(
        event: 'pusher:pong',
        data: const {},
      );
      return;
    }

    if (msg.event == 'pusher:error') {
      debugPrint('pusher:error: ${msg.data}');
    }
  }
}
