import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/chat/repositories/send_message_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class SendMessageController extends GetxController {
  final SendMessageRepository sendMessageRepository;
  SendMessageController({required this.sendMessageRepository});
  RxBool isLoading = false.obs;
  final selectedImages = <XFile>[].obs;
  final imagePicker = ImagePicker();

  Future<void> sendMessage({
    required int conversationID,
    required String message,
  }) async {
    final trimmed = message.trim();
    if (trimmed.isNotEmpty || selectedImages.isNotEmpty) {
      isLoading.value = true;
      final images = selectedImages.map((e) => File(e.path)).toList();
      final response = await sendMessageRepository.execute(
        conversationID: conversationID,
        message: trimmed,
        images: images.isEmpty ? null : images,
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          if (images.isNotEmpty) selectedImages.clear();
        },
      );
    }
  }
}
