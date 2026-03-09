import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/features/chat/models/websocket_connection_model.dart';

class ReceiveWebsocketEventRepository {
  const ReceiveWebsocketEventRepository();

  Either<ErrorModel, WebSocketConnectionMessage> parse(dynamic raw) {
    final text = raw?.toString();
    if (text == null || text.isEmpty) {
      return left(ErrorModel(statusCode: 400, message: 'Empty message'));
    }
    final msg = WebSocketConnectionMessage.fromRaw(text);
    if (msg == null) {
      return left(ErrorModel(statusCode: 400, message: 'Invalid message'));
    }
    return right(msg);
  }
}
