import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/repositories/send_websocket_event_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class WebsocketEventSendController extends GetxController {
  final SendWebsocketEventRepository sendWebsocketEventRepository;
  WebsocketEventSendController({required this.sendWebsocketEventRepository});

  Future<bool> sendEvent({
    required String event,
    required Map<String, dynamic> data,
  }) async {
    final response = await sendWebsocketEventRepository.execute(
      payload: {'event': event, 'data': data},
    );
    return response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
        return false;
      },
      (ok) => ok,
    );
  }

  Future<bool> subscribe({
    required String channelName,
    required String auth,
  }) async {
    debugPrint('Subscribing channel: $channelName');
    return sendEvent(
      event: 'pusher:subscribe',
      data: {
        'channel': channelName,
        'auth': auth,
      },
    );
  }
}
