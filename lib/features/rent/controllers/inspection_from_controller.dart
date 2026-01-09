import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InspectionFromController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  RxList inspectOption = ['In-Person Visit', 'Virtual Tour'].obs;
  RxString selectedInspection = 'Inspection Type'.obs;
  RxBool isSelectedInspection = false.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  RxBool isAgree = false.obs;

  RxList<bool> isShowFAQ = <bool>[].obs;

  List<Map<String, dynamic>> faqList = [
    {
      'title': 'How long does an inspection take?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
    {
      'title': 'Can I reschedule my appointment?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
    {
      'title': 'Do I need to bring documents?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
    {
      'title': 'Is there any cost for booking an inspection?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
  ];
  @override
  void onInit() {
    isShowFAQ.value = List.filled(faqList.length + 1, true);
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    timeController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
