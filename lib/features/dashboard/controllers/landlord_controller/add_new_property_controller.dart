import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewPropertyController extends GetxController {
  RxBool isNewProperty = false.obs;
  RxBool isPropertyDetails = false.obs;
  TextEditingController imageDescriptionController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController bathController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController featureController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedProperty = ''.obs;
  List propertyType = ['House', 'Vila', 'Studio', 'Office', 'Apartment'];
  RxInt inspectionNo = 0.obs;
  RxList<int> selectedFeature = <int>[].obs;
  ImagePicker picker = ImagePicker();
  Rxn<XFile> images = Rxn<XFile>();
  ImagePicker vrPicker = ImagePicker();
  Rxn<XFile> vrImages = Rxn<XFile>();

  List featureList = [
    'Swimming Pool',
    '24/7 Security',
    'Close to Schools',
    'Gym & Fitness Center',
    'Garden & Outdoor Space',
    'Close to Hospital',
    'Close to Restaurant',
    'Pet Allowance',
  ];
  RxString selectedAgent = ''.obs;
  List agentList = ['Ariful', 'Rafi', 'Shanto'];
  List inspectionType = ['In-Person Inspection', 'Virtual Tour'];

  @override
  void dispose() {
    imageDescriptionController.dispose();
    areaController.dispose();
    rentController.dispose();
    bedController.dispose();
    bathController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    zipController.dispose();
    descriptionController.dispose();
    featureController.dispose();
    dateController.dispose();
    stateController.dispose();
    super.dispose();
  }
}
