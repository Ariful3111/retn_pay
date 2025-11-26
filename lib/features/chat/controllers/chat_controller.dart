import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  RxBool isActive = false.obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  RxBool isMe = false.obs;
  Rxn<XFile> selectImage = Rxn<XFile>();
  ImagePicker sendImage = ImagePicker();
}
