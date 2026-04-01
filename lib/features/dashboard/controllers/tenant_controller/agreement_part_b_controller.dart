import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/agreement_model.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_cleaning.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_repair.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_report.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_service.dart';

class AgreementPartBController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;
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
  final emailController = TextEditingController(

  );

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
  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
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
