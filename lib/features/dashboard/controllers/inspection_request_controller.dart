import 'package:get/get.dart';

class InspectionRequestController extends GetxController {
  RxInt isInspectionType = 0.obs;
  RxBool isFilter = false.obs;
  RxInt filterIndex = 0.obs;
  final List inspectionTypeList = ['Scheduled', 'Pending', 'History'];
  final List filterList = ['All', 'Approved', 'Complete'];
  final List tableColumn = ['Property Address', 'Status', 'Action'];
  final List firstColumn = [
    '987 Birch Boulevard',
    '456 Oak Avenue',
    '123 Elm Street',
  ];
  final List secondColumn = ['Approved','Complete',];
}
