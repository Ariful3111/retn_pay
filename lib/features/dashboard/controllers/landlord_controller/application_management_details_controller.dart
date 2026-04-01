import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/application_details_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/application_details_repo.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_info.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a_application.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_b.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_d.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_service.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ApplicationManagementDetailsController extends GetxController {
  final ApplicationDetailsRepository applicationDetailsRepository;
  ApplicationManagementDetailsController({
    required this.applicationDetailsRepository,
  });
  final applicationDetails = Rxn<ApplicationDetailsModel>();
  RxBool isLoading = false.obs;
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

  List<Widget> widgetList = [
    ApplicationManagementDetailsPartA(),
    ApplicationManagementDetailsPartB(),
    ApplicationManagementDetailsPartC(),
    ApplicationManagementDetailsPartD(),
    ApplicationManagementDetailsPartE(),
    ApplicationManagementDetailsInfo(),
    ApplicationManagementDetailsService(),
  ];
  List<Widget> informationWidgetList = [
    ApplicationManagementDetailsPartAProvider(),
    ApplicationManagementDetailsPartAApplication(),
  ];

  RxString selectedPaymentType = ''.obs;

  final Map<String, TextEditingController> fieldControllers = {};

  TextEditingController getFieldController(String key) {
    if (!fieldControllers.containsKey(key)) {
      fieldControllers[key] = TextEditingController();
    }
    return fieldControllers[key]!;
  }

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      getApplicationDetails();
    }
    isOpenList.value = List.generate(title.length, (_) => false);
    isInformationOpenList.value = List.generate(
      informationTitle.length,
      (_) => false,
    );
  }

  Future<void> getApplicationDetails() async {
    isLoading.value = true;
    final response = await applicationDetailsRepository.execute(
      applicationID: Get.arguments.toString(),
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        applicationDetails.value = data;
      },
    );
  }

  @override
  dispose() {
    for (var controller in fieldControllers.values) {
      controller.dispose();
    }
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
