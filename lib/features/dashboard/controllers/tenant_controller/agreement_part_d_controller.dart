import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_access.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_assignment.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_condition.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_lock.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_pets.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_premises.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_modification.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_rent.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d_repair.dart';

class AgreementPartDController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;

  // Reference to main agreements controller
  final GetAgreementsController agreementsController =
      Get.find<GetAgreementsController>();

  List<String> title = [
    'Use of the premises',
    'Condition of the premises',
    'Modifications',
    'Locks',
    'Repairs',
    'Assignment or sub-letting',
    'Rent',
    'Access and entry',
    'Pets ',
  ];
  List<Widget> widgets = [
    AgreementPartDPremises(),
    AgreementPartDCondition(),
    AgreementPartDModification(),
    AgreementPartDLock(),
    AgreementPartDRepair(),
    AgreementPartDAssignment(),
    AgreementPartDRent(),
    AgreementPartDAccess(),
    AgreementPartDPets(),
  ];

  // Populate data from API
  void populateFromApi() {
    final agreement = agreementsController.firstAgreement;
    if (agreement == null) return;

    // Part D contains rights and obligations
    // Most of these are standard legal terms, but can be customized if API provides them
    final terms = agreement.terms;
    if (terms != null && terms.isNotEmpty) {
      // Custom terms would be loaded here if available
    }
  }

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);

    // Populate data from API
    Future.delayed(Duration(milliseconds: 800), () {
      populateFromApi();
    });

    super.onInit();
  }
}
