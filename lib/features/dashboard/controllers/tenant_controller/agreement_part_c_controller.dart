import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_activities.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_relocatable.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_report.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_smoke.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_swimming.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_water.dart';

class AgreementPartCController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;

  // Reference to main agreements controller
  final GetAgreementsController agreementsController =
      Get.find<GetAgreementsController>();

  List<String> title = [
    '13. Condition report',
    '14. Gas safety activities',
    '15. Smoke alarm safety activities',
    '16. Swimming pool barrier safety activities',
    '17. Relocatable swimming pool safety activities',
    '18. Relocatable water tank safety activities',
  ];
  List<Widget> widgetList = [
    AgreementPartCReport(),
    AgreementPartCActivities(),
    AgreementPartCSmoke(),
    AgreementPartCSwimming(),
    AgreementPartCRelocatable(),
    AgreementPartCWater(),
  ];

  // Populate data from API
  void populateFromApi() {
    final agreement = agreementsController.firstAgreement;
    if (agreement == null) return;

    // Part C typically contains safety-related activities
    // These would be populated from agreement terms if available
    // Currently these are mostly static legal requirements
  }

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);

    // Populate data from API
    Future.delayed(Duration(milliseconds: 700), () {
      populateFromApi();
    });

    super.onInit();
  }
}
