import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_e_widgets/agreement_part_e_condition.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_e_widgets/agreement_part_e_signatures.dart';
import 'package:signature/signature.dart';

class AgreementPartEController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;

  // Reference to main agreements controller
  final GetAgreementsController agreementsController =
      Get.find<GetAgreementsController>();

  List<String> title = ['21. Extended Conditions (if any)', '22. Signatures'];
  List<Widget> widgets = [
    AgreementPartECondition(),
    AgreementPartESignatures(),
  ];
  final TextEditingController additionalTermsController =
      TextEditingController();
  final List<SignatureController> renterSignatures = List.generate(
    4,
    (_) => SignatureController(
      penStrokeWidth: 2,
      penColor: AppColors.darkContainer,
      exportBackgroundColor: AppColors.whiteColor,
    ),
  );

  final List<SignatureController> providerSignatures = List.generate(
    2,
    (_) => SignatureController(
      penStrokeWidth: 2,
      penColor: AppColors.darkContainer,
      exportBackgroundColor: AppColors.whiteColor,
    ),
  );

  final List<TextEditingController> renterDates = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<TextEditingController> providerDates = List.generate(
    2,
    (_) => TextEditingController(),
  );

  // Populate data from API
  void populateFromApi() {
    final agreement = agreementsController.firstAgreement;
    if (agreement == null) return;

    final signatures = agreement.agreementDetails?.signatures;
    if (signatures == null) return;

    // Load renter signatures and dates
    if (signatures.renters != null) {
      for (int i = 0; i < signatures.renters!.length && i < 4; i++) {
        final renterSig = signatures.renters![i];
        if (i < renterDates.length) {
          if (renterSig.signedDate != null) {
            renterDates[i].text = _formatDate(renterSig.signedDate!);
          }
          // Note: Signature images can't be loaded into SignatureController
          // as they require user to draw. We can only load the date.
        }
      }
    }

    // Load provider signatures and dates
    if (signatures.rentalProviders != null) {
      for (int i = 0; i < signatures.rentalProviders!.length && i < 2; i++) {
        final providerSig = signatures.rentalProviders![i];
        if (i < providerDates.length) {
          if (providerSig.signedDate != null) {
            providerDates[i].text = _formatDate(providerSig.signedDate!);
          }
        }
      }
    }
  }

  // Helper method to format date
  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return '';
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    } catch (e) {
      return dateStr;
    }
  }

  @override
  void dispose() {
    additionalTermsController.dispose();
    for (var c in renterSignatures) {
      c.dispose();
    }
    for (var c in providerSignatures) {
      c.dispose();
    }
    for (var c in renterDates) {
      c.dispose();
    }
    for (var c in providerDates) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);

    // Populate data from API
    Future.delayed(Duration(milliseconds: 900), () {
      populateFromApi();
    });

    super.onInit();
  }
}
