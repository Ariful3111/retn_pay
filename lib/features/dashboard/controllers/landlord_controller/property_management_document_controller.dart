import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PropertyManagementDocumentController extends GetxController {
  RxList<XFile> landImage = <XFile>[].obs;
  RxList<XFile> insuranceImage = <XFile>[].obs;
  RxList<XFile> electricalImage = <XFile>[].obs;
  RxList<XFile> signImage = <XFile>[].obs;
  RxList<XFile> plumbingImage = <XFile>[].obs;
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController propertyAddressController = TextEditingController();

  @override
  void dispose() {
    propertyNameController.dispose();
    propertyAddressController.dispose();
    super.dispose();
  }
}
