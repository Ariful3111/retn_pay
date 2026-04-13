import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/agreement_model.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_cleaning.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_repair.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_report.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_service.dart';

class AgreementPartBController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;

  // Reference to main agreements controller
  final GetAgreementsController agreementsController =
      Get.find<GetAgreementsController>();

  final renters = List.generate(
    4,
    (index) => AgreementPartBServiceModel(
      title: "Renter ${index + 1}:",
      controller: TextEditingController(),
      isYes: false.obs,
      isNo: false.obs,
    ),
  ).obs;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  List<String> title = [
    '8. Rental provider\'s preferred method of rent payment',
    '9. Service of notices and other documents by electronic methods',
    '10. Urgent repairs',
    '11. Professional cleaning',
    '12. Condition report',
  ];

  List<Widget> widgetList = [
    AgreementPartBProvider(),
    AgreementPartBService(),
    AgreementPartBRepair(),
    AgreementPartBCleaning(),
    AgreementPartBReport(),
  ];

  // Populate data from API
  void populateFromApi() {
    final agreement = agreementsController.firstAgreement;
    if (agreement == null) return;

    final standardTerms = agreement.agreementDetails?.standardTerms;
    if (standardTerms == null) return;

    // Rental payment method
    if (standardTerms.rentalPaymentMethod != null) {
      // This would populate the payment method widget
    }

    // Emergency contact details
    if (standardTerms.emergencyContact != null) {
      nameController.text = standardTerms.emergencyContact!.name ?? '';
      phoneController.text = standardTerms.emergencyContact!.phoneNumber ?? '';
      emailController.text = standardTerms.emergencyContact!.emailAddress ?? '';
    }

    // Renter contact consents
    if (standardTerms.renterContactConsents != null) {
      for (
        int i = 0;
        i < standardTerms.renterContactConsents!.length && i < 4;
        i++
      ) {
        final consent = standardTerms.renterContactConsents![i];
        if (i < renters.length) {
          renters[i].controller.text = consent.contactDetails ?? '';
          renters[i].isYes.value = consent.consentGiven ?? false;
        }
      }
    }
  }

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);

    // Populate data from API
    Future.delayed(Duration(milliseconds: 600), () {
      populateFromApi();
    });

    super.onInit();
  }

  @override
  void dispose() {
    for (var renter in renters) {
      renter.controller.dispose();
    }
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
