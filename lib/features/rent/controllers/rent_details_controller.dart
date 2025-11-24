import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RentDetailsController extends GetxController{
  ImagePicker picker = ImagePicker();
  Rxn<XFile> frontImage = Rxn<XFile>();
  Rxn<XFile> backImage = Rxn<XFile>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  RxBool isAgree = false.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  RxList<bool> isShowFAQ = <bool>[].obs;
  RxList inspectOption = ['In-Person Visit','Virtual Tour'].obs;
  RxString selectedInspection = 'In-Person Visit'.obs;
  RxBool isSelectedInspection = false.obs;
  List <Map<String,dynamic>> faqList =[
      {'title':'How long does an inspection take?','subtitle':'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.'},
      {'title':'Can I reschedule my appointment?','subtitle':'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.'},
      {'title':'Do I need to bring documents?','subtitle':'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.'},
      {'title':'Is there any cost for booking an inspection?','subtitle':'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.'},
    ];
  String? emailValidation(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) {
      return "Email is required";
    }
    final RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailReg.hasMatch(text)) {
      return null;
    }
    {
      return "Enter a valid email address";
    }
  }

  String? phoneValidation(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) {
      return "Phone number is required";
    }
    final RegExp phoneReg = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
    if (phoneReg.hasMatch(text)) {
      return null;
    }
    return "Enter a valid phone number";
  }

  @override
  void onInit() {
    isShowFAQ.value=List.filled(faqList.length+1, true);
    super.onInit();
  }
}