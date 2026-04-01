import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartAProviderAgent extends GetWidget<AgreementPartAController> {
  const AgreementPartAProviderAgent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text: "Rental provider's agent's details (if applicable)",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 16.h),
        helper.agreementField(
          label: 'Full name',
          controller: controller.agentNameController,
          isDark: isDark,
        ),
        helper.agreementField(
          label: 'Address',
          controller: controller.agentAddressController,
          isDark: isDark,
          maxLines: 2,
        ),
        helper.agreementField(
          label: 'Postcode',
          controller: controller.agentPostcodeController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
        helper.agreementField(
          label: 'Phone number',
          controller: controller.agentPhoneController,
          isDark: isDark,
          keyboardType: TextInputType.phone,
        ),
        helper.agreementField(
          label: 'Email address',
          controller: controller.agentEmailController,
          isDark: isDark,
          keyboardType: TextInputType.emailAddress,
        ),
        helper.agreementField(
          label: 'ABN (if applicable)',
          controller: controller.agentABNController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}