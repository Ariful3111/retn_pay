import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/models/websocket_connection_model.dart';
import 'package:renter_pay/features/chat/repositories/connect_websocket_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class WebsocketConnectController extends GetxController {
  final ConnectWebsocketRepository connectWebsocketRepository;
  WebsocketConnectController({required this.connectWebsocketRepository});

  WebSocket? _ws;
  final socketId = ''.obs;
  final connected = false.obs;
  bool _connecting = false;

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
    if (msg?.event != 'pusher:connection_established') return;
    final data = WebSocketConnectionEstablishedData.fromDynamic(msg?.data);
    socketId.value = data?.socketId ?? '';
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
