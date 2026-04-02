// ignore_for_file: unused_element
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_event_send_controller.dart';
import 'package:renter_pay/features/chat/repositories/get_socket_token_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class GetSocketTokenController extends GetxController {
  final GetSocketTokenRepository getSocketTokenRepository;
  GetSocketTokenController({required this.getSocketTokenRepository});
  final websocketConnectController = Get.find<WebsocketConnectController>();

  Future<void> getSocketToken({required String channelName}) async {
    final ready = await websocketConnectController.ensureConnected();
    if (!ready) {
      ErrorSnackbar.show(description: 'Socket not connected');
      return;
    }
    final response = await getSocketTokenRepository.execute(
      socketID: websocketConnectController.socketID.value,
      channelName: channelName,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        final auth = data.auth?.toString() ?? '';
        await Get.find<WebsocketEventSendController>().subscribe(
          channelName: channelName,
          auth: auth,
        );
      },
    );
  }
}
