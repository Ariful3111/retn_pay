import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/get_socket_token_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';

class UserChannelController extends GetxController {
  final GetSocketTokenController getSocketTokenController;
  UserChannelController({required this.getSocketTokenController});

  final isSubscribed = false.obs;
  final currentUserId = RxnInt();

  Future<void> subscribeToUserChannel() async {
    if (isSubscribed.value) return;

    // Get current user ID from ProfileController
    final profileController = Get.find<ProfileController>();
    final userId = profileController.profileData.value?.data?.id;

    if (userId == null) {
      // Retry after profile is loaded
      Future.delayed(const Duration(seconds: 2), () {
        if (!isSubscribed.value) {
          subscribeToUserChannel();
        }
      });
      return;
    }

    currentUserId.value = userId;
    final channelName = 'private-chat.user.$userId';

    await getSocketTokenController.getSocketToken(channelName: channelName);
    isSubscribed.value = true;
    debugPrint('UserChannelController: Subscribed to $channelName');
  }

  @override
  void onInit() {
    super.onInit();
    // Wait for WebSocket to be connected before subscribing
    _waitForConnection();
  }

  Future<void> _waitForConnection() async {
    final wsController = Get.find<WebsocketConnectController>();
    await wsController.ensureConnected();
    await subscribeToUserChannel();
  }
}
