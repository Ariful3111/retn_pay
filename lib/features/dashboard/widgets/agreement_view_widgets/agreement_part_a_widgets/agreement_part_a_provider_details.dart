import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';

class AgreementPartAProviderDetails extends GetWidget<AgreementPartAController> {
  const AgreementPartAProviderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        helper.agreementField(
          label: 'Address',
          controller: controller.rentalProviderAddressController,
          isDark: isDark,
          maxLines: 2,
        ),
        helper.agreementField(
          label: 'Postcode',
          controller: controller.rentalProviderPostcodeController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
        helper.agreementField(
          label: 'Phone number',
          controller: controller.rentalProviderPhoneController,
          isDark: isDark,
          keyboardType: TextInputType.phone,
        ),
        helper.agreementField(
          label: 'Email address',
          controller: controller.rentalProviderEmailController,
          isDark: isDark,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}