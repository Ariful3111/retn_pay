import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';

class ConnectWebsocketRepository {
  Future<Either<ErrorModel, WebSocket>> execute() async {
    try {
      final ws = await WebSocket.connect(NetworkLinks.webSocketServerUrl);
      return right(ws);
    } catch (_) {
      return left(ErrorModel.fromUnknown());
    }
  }
}
