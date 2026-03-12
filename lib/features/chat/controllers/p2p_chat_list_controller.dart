import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/controllers/unread_count_controller.dart';
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
    final status = Get.find<ChatController>().selectItem.value == 0
        ? "active"
        : "archive";
    final search = Get.find<ChatController>().searchController.text;
    final response = await p2pChatListRepository.execute(
      page: page,
      status: status,
      search: search,
    );
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
          // Sync unread count to global controller
          if (Get.isRegistered<UnreadCountController>()) {
            Get.find<UnreadCountController>().syncFromChatList(data);
          }
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
        // Sync unread count to global controller
        if (Get.isRegistered<UnreadCountController>()) {
          Get.find<UnreadCountController>().syncFromChatList(chats.value);
        }
      },
    );
  }

  Future<void> refreshList() async {
    isLoading.value = true;
    isLoadingMore.value = false;
    _page = 1;
    _lastPage = null;
    await getChatList(page: 1);
  }

  Future<void> loadNextPage() async {
    if (isLoading.value || isLoadingMore.value) return;
    final last = _lastPage;
    if (last != null && _page >= last) return;
    isLoadingMore.value = true;
    await getChatList(page: _page + 1);
    isLoadingMore.value = false;
  }

  late final Worker _tabWorker;

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
    _tabWorker = ever<int>(Get.find<ChatController>().selectItem, (_) async {
      await refreshList();
    });
    getChatList(page: 1);
  }

  @override
  void onClose() {
    _tabWorker.dispose();
    super.onClose();
  }
}
