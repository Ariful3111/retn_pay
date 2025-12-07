import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class ChatController extends GetxController {
  RxBool isActive = false.obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  RxBool isMe = false.obs;
  Rxn<XFile> selectImage = Rxn<XFile>();
  ImagePicker sendImage = ImagePicker();
  final scrollController = ScrollController();

  @override
  void onInit() {
    Get.find<GlobalScrollController>().listen(scrollController);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
