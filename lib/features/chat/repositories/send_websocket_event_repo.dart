import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';

class SendWebsocketEventRepository {
  final WebsocketConnectController websocketConnectController;
  SendWebsocketEventRepository({required this.websocketConnectController});

  Future<Either<ErrorModel, bool>> execute({
    required Map<String, dynamic> payload,
  }) async {
    final ready = await websocketConnectController.ensureConnected();
    if (!ready) {
      return left(ErrorModel(statusCode: 400, message: 'Socket not connected'));
    }
    final ws = websocketConnectController.socket;
    if (ws == null) {
      return left(ErrorModel(statusCode: 400, message: 'Socket not connected'));
    }

    try {
      ws.add(jsonEncode(payload));
      return right(true);
    } catch (_) {
      return left(ErrorModel.fromUnknown());
    }
  }
}
