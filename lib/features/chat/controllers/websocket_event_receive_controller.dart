import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
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
      if (decoded != null && Get.isRegistered<MessageController>()) {
        Get.find<MessageController>().addIncomingMessage(
          MessageItem.fromJson(decoded),
        );
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
