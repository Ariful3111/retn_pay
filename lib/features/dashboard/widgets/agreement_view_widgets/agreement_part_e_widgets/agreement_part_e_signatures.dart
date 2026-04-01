import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_e_widgets/agreement_part_e_signatures_pad.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartESignatures extends GetWidget<AgreementPartEController> {
  const AgreementPartESignatures({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(
          text:
              'This agreement is made under the Residential Tenancies Act 1997.\n'
              'Before signing you must read Part D - Rights and obligations in this form.',
        ),

        SizedBox(height: 16.h),

        _title(text: 'Rental provider'),
        SizedBox(height: 12.h),
        ...List.generate(
          controller.providerSignatures.length,
          (index) => AgreementPartESignaturesPad(
            title: 'Signature of rental provider ${index + 1}',
            signatureController: controller.providerSignatures[index],
            dateController: controller.providerDates[index],
          ),
        ),
        SizedBox(height: 20.h),
        _title(text: 'Rental Provider'),
        SizedBox(height: 8.h),
        _title(
          text:
              'All renters listed must sign this residential rental agreement.',
          color: isDark ? AppColors.darkSecondaryText : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(
          controller.renterSignatures.length,
          (index) => AgreementPartESignaturesPad(
            title: 'Signature of renter ${index + 1}',
            signatureController: controller.renterSignatures[index],
            dateController: controller.renterDates[index],
          ),
        ),
        SizedBox(height: 12.h),
        AgreementHelper().richText(
          title: 'Note:',
          spantext:
              ' Each renter who is a party to the agreement must sign and date here. If there are more than four renters, include details on an extra page.',
          color: isDark ? AppColors.darkSecondaryText : AppColors.darkTextColor,
        ),
      ],
    );
  }

  Widget _title({required String text, Color? color}) {
    return CustomTextPrimary(
      text: text,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: color ?? AppColors.primaryColorDark,
    );
  }
}
