import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/models/chat_list_model.dart';
import 'package:renter_pay/features/chat/repositories/p2p_chat_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class P2PChatListController extends GetxController {
  final P2PChatListRepository p2pChatListRepository;
  P2PChatListController({required this.p2pChatListRepository});

  final chats = Rxn<ChatListModel>();
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;

  int _page = 1;
  int? _lastPage;

  Future<void> getChatList({int page = 1}) async {
    final response = await p2pChatListRepository.execute(page: page);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        _page = page;
        _lastPage = data.data?.meta?.lastPage;
        if (page == 1 || chats.value == null) {
          chats.value = data;
          return;
        }
        final existing = chats.value?.data?.data;
        final incoming = data.data?.data ?? const <ChatConversation>[];
        if (existing == null) {
          chats.value = data;
          return;
        }
        existing.addAll(incoming);
        chats.refresh();
      },
    );
  }

  Future<void> loadNextPage() async {
    if (isLoading.value || isLoadingMore.value) return;
    final last = _lastPage;
    if (last != null && _page >= last) return;
    isLoadingMore.value = true;
    await getChatList(page: _page + 1);
    isLoadingMore.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<ChatController>().scrollController.addListener(() {
      final scrollController = Get.find<ChatController>().scrollController;
      if (!scrollController.hasClients) return;
      final position = scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 240) {
        loadNextPage();
      }
    });
    getChatList(page: 1);
  }
}
