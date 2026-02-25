import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_insurance.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_share.dart';

class PropertyModel {
  final String address;
  final String verifyStatus;
  final String rent;
  final String agent;
  final String enlistStatus;
  final String date;
  final String email;
  final String phoneNo;
  PropertyModel({
    required this.address,
    required this.verifyStatus,
    required this.rent,
    required this.agent,
    required this.enlistStatus,
    required this.date,
    required this.email,
    required this.phoneNo,
  });
}

enum MyMenu { view, share, insurance, reEnlist, conditionalReport }

class PropertyManagementController extends GetxController {
  List<String> manageType = ['Property', 'Conditional Report'];
  ScrollController propertyScrollController = ScrollController();
  RxString selected = 'Property'.obs;
  TextEditingController shareController = TextEditingController();
  RxString selectedProperty = ''.obs;
  List<String> propertyOption = ['Property 01', 'Property 02'];
  RxList<XFile> imageList = <XFile>[].obs;
  RxBool isShare = false.obs;
  // RxBool isViewProperty = false.obs;
  final List<String> tableColumn = [
    'Property Address',
    'Enlisting Status',
    'Action',
  ];
  final List<String> agentTableColumn = [
    'Property Address',
    'Monthly Rent',
    'Action',
  ];
  final List<String> conditionReportTableColumn = [
    'Property Address',
    'Date',
    'Condition Report',
  ];
  final RxMap<int, MyMenu?> selectedMenu = <int, MyMenu?>{}.obs;
  void setMenu(int index, MyMenu menu) {
    selectedMenu[index] = menu;
    final property = allRows[index];
    switch (menu) {
      case MyMenu.share:
        Get.dialog(PropertyShare(property: property));
        break;
      case MyMenu.insurance:
        Get.dialog(PropertyInsurance(property: property));
      case MyMenu.view:
        Future.delayed(Duration(milliseconds: 300), () {
          Get.toNamed(AppRoutes.propertyManagementDetails);
          for (final position in propertyScrollController.positions) {
            position.animateTo(
              position.minScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        });
      case MyMenu.conditionalReport:
        Future.delayed(Duration(milliseconds: 300), () {
          selected.value = 'Conditional Report';
          for (final position in propertyScrollController.positions) {
            position.animateTo(
              position.minScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        });
      default:
        null;
    }
  }

  MyMenu? getMenu(int index) {
    return selectedMenu[index];
  }

  RxList<PropertyModel> allRows = <PropertyModel>[].obs;
  RxList<PropertyModel> conditionRows = <PropertyModel>[].obs;
  RxList<bool> expanded = <bool>[].obs;
  RxList<bool> expandedCondition = <bool>[].obs;

  List<MapEntry<int, PropertyModel>> get listData {
    final tempRow = <MapEntry<int, PropertyModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    return tempRow;
  }

  List<MapEntry<int, PropertyModel>> get listConditionData {
    final tempRow = <MapEntry<int, PropertyModel>>[];
    for (int i = 0; i < conditionRows.length; i++) {
      tempRow.add(MapEntry(i, conditionRows[i]));
    }
    return tempRow;
  }

  void rowData() {
    allRows.value = [
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Pending',
        rent: '\$650',
        agent: 'Mehbubur Rahman ',
        enlistStatus: '-',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Pending',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: '-',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Approved',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: 'Publish',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Approved',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: 'Publish',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Rejected',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: 'Publish',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Rejected',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: '-',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
    ];
    conditionRows.value = [
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Pending',
        rent: '\$650',
        agent: 'Mehbubur Rahman ',
        enlistStatus: '-',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Pending',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: '-',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Approved',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: 'Publish',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Approved',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: 'Publish',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Rejected',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: 'Publish',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
      PropertyModel(
        address: '789 Pine Road',
        verifyStatus: 'Rejected',
        rent: '\$650',
        agent: 'Mehbubur Rahman',
        enlistStatus: '-',
        date: '8 Aug, 2025',
        email: 'suriya123@gmail.com',
        phoneNo: '+1234567890',
      ),
    ];
    expanded.value = List.generate(allRows.length, (_) => false);
    expandedCondition.value = List.generate(conditionRows.length, (_) => false);
    update();
  }

  void toggleExpanded(int index) {
    if (index >= 0 && index < expanded.length) {
      expanded[index] = !expanded[index];
    }
  }

  void toggleCondition(int index) {
    if (index >= 0 && index < expandedCondition.length) {
      expandedCondition[index] = !expandedCondition[index];
    }
  }

  @override
  void onReady() {
    rowData();
    super.onReady();
  }
}
