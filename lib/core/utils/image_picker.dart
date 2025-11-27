import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage {
  static Future<void> pickDocument({
    required String type,
    required Rxn<XFile> frontImage,
    required Rxn<XFile> backImage,
    required ImagePicker picker,
  }) async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        if (type == 'front') {
          frontImage.value = image;
        } else if (type == 'back') {
          backImage.value = image;
        }
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print('$e');
    }
  }

  static Future<void> sendImage({
    required ImagePicker picker,
    required Rxn<XFile> pickImage,
  }) async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickImage.value = image;
    }
  }
}
