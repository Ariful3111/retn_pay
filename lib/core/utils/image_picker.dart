import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/utils/snackbar.dart';

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
          successSnack(message: "Image Uploaded");
        } else if (type == 'back') {
          backImage.value = image;
          successSnack(message: "Image Uploaded");
        }
      } else {
        errorSnack(message: "Image Not Selected");
      }
    } catch (e) {
      errorSnack(message: 'Failed to pick image: $e');
    }
  }
}
