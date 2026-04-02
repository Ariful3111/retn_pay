import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_e_widgets/agreement_part_e_condition.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_e_widgets/agreement_part_e_signatures.dart';
import 'package:signature/signature.dart';

class AgreementPartEController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;
  List<String> title = ['21. Extended Conditions (if any)', '22. Signatures'];
  List<Widget> widgets = [AgreementPartECondition(), AgreementPartESignatures()];
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
    super.onInit();
  }
}
