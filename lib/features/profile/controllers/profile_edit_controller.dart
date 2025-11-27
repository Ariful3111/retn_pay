import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditController extends GetxController {
  ImagePicker picker = ImagePicker();
  Rxn<XFile> upload = Rxn<XFile>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController subsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  RxBool isPets = false.obs;
  RxBool isParking = false.obs;
  RxString initialPet = 'Dog'.obs;
  RxList petType = ['Dog','Cat'].obs;
  RxBool isSelectedPet = false.obs;
}
