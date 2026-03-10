import 'package:get/get.dart';
import 'package:renter_pay/features/chat/repositories/send_message_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class SendMessageController extends GetxController {
  final SendMessageRepository sendMessageRepository;
  SendMessageController({required this.sendMessageRepository});
  RxBool isLoading = false.obs;

  Future<void> sendMessage({
    required int conversationID,
    required String message,
  }) async {
    if (message.isNotEmpty) {
      isLoading.value = true;
      final response = await sendMessageRepository.execute(
        conversationID: conversationID,
        message: message,
      );
      isLoading.value = false;
      response.fold((error) {
        ErrorSnackbar.show(description: error.message);
      }, (data) {});
    }
  }
}
