import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a_application.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_b.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_d.dart';

/// Model class for disclosure items

class ApplicationManagementDetailsController extends GetxController {
  List<String> items = [
    'Part A-Important information;',
    'Part B-Statement of information for rental applicants; and',
    'Part C-Mandatory disclosures checklist.',
  ];
  RxList<bool> isOpenList = <bool>[].obs;
  RxList<bool> isInformationOpenList = <bool>[].obs;

  List<String> title = [
    'Part A - Important information',
    'Part B - Statement of information for rental applicants',
    'Part C - Mandatory disclosures checklist',
    'Part D - To be completed by rental provider/agent',
    'Part E - To be completed by applicant',
    'Help or further information',
    'Telephone interpreter service',
  ];
  List<String> informationTitle = [
    'Information for the rental provider',
    'Information for the applicant(s)',
  ];

  /// Empty for now (you can plug widgets later like form sections)
  List<Widget> widgetList = [
    ApplicationManagementDetailsPartA(),
    ApplicationManagementDetailsPartB(),
    ApplicationManagementDetailsPartC(),
    ApplicationManagementDetailsPartD(),
  ];
  List<Widget> informationWidgetList = [
    ApplicationManagementDetailsPartAProvider(),
    ApplicationManagementDetailsPartAApplication(),
  ];
/// 🔹 Payment Type
RxString selectedPaymentType = ''.obs;

/// 🔹 Dynamic Controllers
final Map<String, TextEditingController> fieldControllers = {};

TextEditingController getFieldController(String key) {
  if (!fieldControllers.containsKey(key)) {
    fieldControllers[key] = TextEditingController();
  }
  return fieldControllers[key]!;
}

/// 🔹 Date Controllers
TextEditingController startDateController = TextEditingController();
TextEditingController endDateController = TextEditingController();
  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    isInformationOpenList.value = List.generate(
      informationTitle.length,
      (_) => false,
    );
    super.onInit();
  }

  
}
