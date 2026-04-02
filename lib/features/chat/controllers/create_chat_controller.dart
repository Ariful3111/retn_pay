import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/chat/models/create_chat_model.dart';
import 'package:renter_pay/features/chat/repositories/create_chat_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class CreateChatController extends GetxController {
  final CreateChatRepository createChatRepository;
  CreateChatController({required this.createChatRepository});

  final createChat = Rxn<CreateChatModel>();
  RxBool isLoading = false.obs;

  Future<void> getCreateChat({required int otherUserID}) async {
    isLoading.value = true;
    final response = await createChatRepository.execute(
      otherUserID: otherUserID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        createChat.value = data;
        Get.toNamed(AppRoutes.messageView, arguments: {"ID": data.data?.id});
      },
    );
  }
}
