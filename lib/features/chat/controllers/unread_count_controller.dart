import 'package:get/get.dart';
import 'package:renter_pay/features/chat/models/chat_list_model.dart';

class UnreadCountController extends GetxController {
  final totalUnreadCount = 0.obs;
  final _conversationUnread = <int, int>{}.obs;

  void syncFromChatList(ChatListModel? chats) {
    int total = 0;
    final map = <int, int>{};
    for (final c in chats?.data?.data ?? <ChatConversation>[]) {
      final count = c.unreadCount ?? 0;
      if (c.id != null) {
        map[c.id!] = count;
        total += count;
      }
    }
    _conversationUnread.value = map;
    totalUnreadCount.value = total;
  }

  void incrementUnread(int? conversationId) {
    if (conversationId == null) return;
    _conversationUnread[conversationId] =
        (_conversationUnread[conversationId] ?? 0) + 1;
    totalUnreadCount.value++;
  }

  void clearConversationUnread(int? conversationId) {
    if (conversationId == null) return;
    final count = _conversationUnread[conversationId] ?? 0;
    if (count > 0) {
      _conversationUnread[conversationId] = 0;
      totalUnreadCount.value = (totalUnreadCount.value - count).clamp(0, 99999);
    }
  }
}
