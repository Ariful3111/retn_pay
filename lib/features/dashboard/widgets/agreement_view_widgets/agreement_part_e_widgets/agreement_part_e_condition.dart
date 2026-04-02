import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartECondition extends GetWidget<AgreementPartEController> {
  const AgreementPartECondition({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          text:
              'List any additional terms to this agreement. The terms listed must not exclude, restrict or modify any of the rights and duties included in the Act.\n'
              'Additional terms must also comply with the Australian Consumer Law (Victoria). For example, they cannot be unfair terms, which will have no effect. '
              'Contact Consumer Affairs Victoria on 1300 55 81 81 for further information or visit unfair contract terms at the Consumer Affairs Victoria website.',
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: controller.additionalTermsController,
          labelText: 'Additional terms (if any)',
        ),
        SizedBox(height: 12.h),
        AgreementHelper().richText(
          title: 'Note:',
          spantext:
              ' If you need extra space, attach a separate sheet. Both the rental provider and renter should sign and date all attachments.',
        ),
        SizedBox(height: 16.h),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }
}
