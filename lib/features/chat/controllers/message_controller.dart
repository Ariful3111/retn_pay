import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/chat/models/message_list_model.dart';
import 'package:renter_pay/features/chat/repositories/get_messages_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class MessageController extends GetxController with WidgetsBindingObserver {
  final GetMessagesRepository getMessagesRepository;
  MessageController({required this.getMessagesRepository});
  TextEditingController messageController = TextEditingController();

  final messageScrollController = TrackingScrollController();
  final messageModel = Rxn<MessageListModel>();
  final messages = <MessageItem>[].obs;
  final currentConversationId = RxnInt();

  void scrollToBottom() {
    // With reverse: true, bottom is at offset 0
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messageScrollController.hasClients) {
        messageScrollController.jumpTo(0);
      }
    });
  }

  void addIncomingMessage(MessageItem item) {
    final cid = currentConversationId.value;
    if (cid == null || item.chatConversationId == cid) {
      messages.add(item);
      scrollToBottom();
    }
  }

  void handleMessagesRead({required dynamic conversationId, String? readAt}) {
    final cid = currentConversationId.value;
    // Only update if we're in the same conversation
    if (cid != null && cid == conversationId) {
      // Update read_at for all messages sent by me
      for (int i = 0; i < messages.length; i++) {
        if (messages[i].isSentByMe == true && messages[i].readAt == null) {
          messages[i] = MessageItem(
            id: messages[i].id,
            chatConversationId: messages[i].chatConversationId,
            senderId: messages[i].senderId,
            isSentByMe: messages[i].isSentByMe,
            message: messages[i].message,
            images: messages[i].images,
            readAt: readAt,
            createdAt: messages[i].createdAt,
            sender: messages[i].sender,
          );
        }
      }
      messages.refresh();
    }
  }

  @override
  void onReady() {
    super.onReady();
    // With reverse: true, bottom is at offset 0
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messageScrollController.hasClients) {
        messageScrollController.jumpTo(0);
      }
    });
  }

  @override
  void didChangeMetrics() {
    // With reverse: true, bottom is at offset 0
    if (messageScrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 100), () {
        if (messageScrollController.hasClients) {
          messageScrollController.animateTo(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
    super.didChangeMetrics();
  }

  Future<void> getMessages({
    required int conversationID,
    required int page,
  }) async {
    currentConversationId.value = conversationID;
    final response = await getMessagesRepository.execute(
      conversationID: conversationID,
      page: page,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        messageModel.value = data;
        messages.addAll(data.data?.data ?? []);
        scrollToBottom();
      },
    );
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    messageScrollController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
