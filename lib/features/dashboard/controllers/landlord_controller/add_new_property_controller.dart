import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';

class AddNewPropertyController extends GetxController {
  RxBool isNewProperty = false.obs;
  RxBool isPropertyDetails = false.obs;
  TextEditingController imageDescriptionController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
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
  RxInt inspectionNo = 0.obs;
  RxList<int> selectedFeature = <int>[].obs;
  RxList<XFile> images = <XFile>[].obs;
  RxList<XFile> vrImages = <XFile>[].obs;
  RxBool isLoading = false.obs;

  RxString selectedAgent = ''.obs;
  List<String> agentList = ['Ariful', 'Rafi', 'Shanto'];
  List<String> inspectionType = ['In-Person Inspection', 'Virtual Tour'];

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await Get.find<PropertyCategoryController>().getPropertyCategories();
    await Get.find<PropertyAmenitiesController>().getPropertyAmenities();
    isLoading.value = false;
  }

  @override
  void dispose() {
    imageDescriptionController.dispose();
    areaController.dispose();
    nameController.dispose();
    unitController.dispose();
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
    images.clear();
    vrImages.clear();
    super.dispose();
  }
}
