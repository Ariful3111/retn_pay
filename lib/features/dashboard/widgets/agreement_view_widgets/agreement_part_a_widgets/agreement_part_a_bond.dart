import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartABond extends GetWidget<AgreementPartAController> {
  const AgreementPartABond({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextSecondary(
                  text: '•',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkTextColor,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: CustomTextSecondary(
                    text:
                        'The renter has been asked to pay the bond specified below.',
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: CustomBulletPointText(
                items: [
                  'Example - Rent is \$600/week = (\$600*52)/12 per month',
                  'Then Bond = \$2,600/12',
                  'Bond Payment = \$216.67/Month',
                  'First Bond Payment = \$216.67',
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomBulletPointText(
              items: [
                'Bond Number - To be added by Admin, because RenterPay will lodge the bond on behalf of the tenant.',
                'The maximum bond is 1 months\' rent (unless the rent is more than \$900 per week). In some cases, the rental provider may ask the Victorian Civil and Administrative Tribunal (VCAT) to increase this limit.',
                'The rental provider or their agent must lodge the bond with the Residential Tenancies Bond Authority (RTBA) within 10 business days after receiving payment. The RTBA will send the renter a receipt for the bond.',
                'If the renter does not receive a receipt within 15 business days of paying the bond, they can email the RTBA at rtba@justice.vic.gov.au, or call the RTBA at 1300 13 71 64.',
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Column(
          children: [
            helper.agreementField(
              label: 'Bond amount (\$)',
              controller: controller.bondAmountController,
              isDark: isDark,
              keyboardType: TextInputType.number,
            ),
            helper.dateFieldWithPicker(
              context: context,
              labelText: 'Date bond payment due',
              controller: controller.bondDateController,
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }
}
