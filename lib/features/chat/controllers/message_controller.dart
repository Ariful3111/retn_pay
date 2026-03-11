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

  void scrollToBottom({int retries = 2}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!messageScrollController.hasClients) {
        if (retries > 0) scrollToBottom(retries: retries - 1);
        return;
      }
      final position = messageScrollController.position;
      messageScrollController.animateTo(
        position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  void addIncomingMessage(MessageItem item) {
    final cid = currentConversationId.value;
    if (cid == null || item.chatConversationId == cid) {
      messages.add(item);
      scrollToBottom();
    }
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messageScrollController.hasClients) {
        messageScrollController.jumpTo(
          messageScrollController.position.maxScrollExtent,
        );
      }
    });
  }

  @override
  void didChangeMetrics() {
    if (messageScrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 100), () {
        if (messageScrollController.hasClients) {
          messageScrollController.animateTo(
            messageScrollController.position.maxScrollExtent,
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
