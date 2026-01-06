import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRepairRequestController extends GetxController {
  RxList<String> repairImages = <String>[].obs;
  final List requestType = <String>['Urgent', 'Non - Urgent'];
  RxInt selectedIndex = 0.obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController issueTitleController = TextEditingController();
  TextEditingController issueDetailsController = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final List timePeriodList = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    '',
  ];
  RxInt checkboxIndex = 0.obs;
  RxBool isCheck = false.obs;
  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    timeController.dispose();
    issueDetailsController.dispose();
    issueTitleController.dispose();
  }
}
