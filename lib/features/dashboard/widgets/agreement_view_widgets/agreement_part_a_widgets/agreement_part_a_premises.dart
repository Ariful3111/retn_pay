import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';

class AgreementPartAPremises extends GetWidget<AgreementPartAController> {
  const AgreementPartAPremises({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Column(
      children: [
        helper.agreementField(
          label: 'Address of premises',
          controller: controller.addressController,
          isDark: isDark,
        ),
        helper.agreementField(
          label: 'Postcode',
          controller: controller.postcodeController,
          isDark: isDark,
        ),
        helper.divider(isDark: isDark),
      ],
    );
  }
}
