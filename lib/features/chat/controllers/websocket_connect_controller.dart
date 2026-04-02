import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_receive_controller.dart';
import 'package:renter_pay/features/chat/models/websocket_connection_model.dart';
import 'package:renter_pay/features/chat/repositories/connect_websocket_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class WebsocketConnectController extends GetxController {
  final ConnectWebsocketRepository connectWebsocketRepository;
  WebsocketConnectController({required this.connectWebsocketRepository});

  WebSocket? _ws;
  final socketID = ''.obs;
  final connected = false.obs;
  bool _connecting = false;

  WebSocket? get socket => _ws;

  Future<bool> ensureConnected({
    Duration timeout = const Duration(seconds: 5),
  }) async {
    if (socketID.value.isNotEmpty) return true;
    if (!connected.value) await connect();
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      if (socketID.value.isNotEmpty) return true;
      await Future.delayed(const Duration(milliseconds: 50));
    }
    return socketID.value.isNotEmpty;
  }

  Future<void> connect() async {
    if (_connecting || (connected.value && _ws != null)) return;
    _connecting = true;
    debugPrint("Trying to connect websocket");
    final response = await connectWebsocketRepository.execute();
    response.fold(
      (error) {
        connected.value = false;
        _connecting = false;
        ErrorSnackbar.show(description: error.message);
      },
      (ws) {
        _ws = ws;
        connected.value = true;
        _connecting = false;
        debugPrint('WebSocket connected');
        ws.listen(
          _handleMessage,
          onDone: () {
            connected.value = false;
            debugPrint('WebSocket disconnected');
          },
          onError: (_) {
            connected.value = false;
            debugPrint('WebSocket disconnected');
          },
        );
      },
    );
  }

  void _handleMessage(dynamic raw) {
    final text = raw?.toString();
    if (text == null || text.isEmpty) return;
    final msg = WebSocketConnectionMessage.fromRaw(text);
    if (msg == null) return;

    if (msg.event == 'pusher:connection_established') {
      final data = WebSocketConnectionEstablishedData.fromDynamic(msg.data);
      socketID.value = data?.socketId ?? '';
    }

    if (Get.isRegistered<WebsocketEventReceiveController>()) {
      Get.find<WebsocketEventReceiveController>().onMessage(msg);
    }
  }

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  @override
  void onClose() {
    _ws?.close();
    super.onClose();
  }
}
