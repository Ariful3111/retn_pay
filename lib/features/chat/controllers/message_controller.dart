import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MessageController extends GetxController with WidgetsBindingObserver {
  TextEditingController messageController = TextEditingController();

  RxBool isMe = false.obs;
  Rxn<XFile> selectImage = Rxn<XFile>();
  ImagePicker sendImage = ImagePicker();
  final messageScrollController = TrackingScrollController();

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
        messageScrollController.animateTo(
          messageScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
    super.didChangeMetrics();
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
