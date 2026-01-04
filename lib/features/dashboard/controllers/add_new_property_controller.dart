import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPropertyController extends GetxController {
  RxBool isNewProperty = false.obs;
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
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedProperty = ''.obs;
  RxString selectedState = ''.obs;
  List propertyType = ['House', 'Vila', 'Studio', 'Office', 'Apartment'];
  List stateType = ['Dhaka', 'Khulna'];
  RxInt inspectionNo = (-1).obs;
  RxList<int> selectedFeature = <int>[].obs;
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
}
