import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RentDetailsController extends GetxController{
  ImagePicker picker = ImagePicker();
  Rxn<XFile> frontImage = Rxn<XFile>();
  Rxn<XFile> backImage = Rxn<XFile>();
}