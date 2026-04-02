import 'package:get/get.dart';
import 'package:renter_pay/features/chat/repositories/mark_read_message_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class MarkReadMessageController extends GetxController {
  final MarkReadMessageRepository markReadMessageRepository;
  MarkReadMessageController({required this.markReadMessageRepository});

  Future<void> markReadMessage({required int conversationID}) async {
    final response = await markReadMessageRepository.execute(
      conversationID: conversationID,
    );
    response.fold((error) {
      ErrorSnackbar.show(description: error.message);
    }, (data) {});
  }
}
