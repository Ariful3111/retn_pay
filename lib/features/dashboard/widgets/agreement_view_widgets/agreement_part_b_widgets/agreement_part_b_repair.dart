import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_b_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartBRepair extends GetWidget<AgreementPartBController> {
  const AgreementPartBRepair({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBulletPointText(
          items: [
            'The rental provider must ensure that the rental property is provided and maintained in good repair.',
            'If there is a need for an urgent repair, the renter should notify the rental provider in writing.',
            'For further information on seeking repairs, see Part D below.',
          ],
        ),
        SizedBox(height: 12.h),
        CustomTextSecondary(
          text:
              'Details of person the renter should contact for an urgent repair (rental provider to insert details).',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkContainer,
        ),
        SizedBox(height: 16.h),
        helper.agreementField(
          label: 'Emergency contact name',
          controller: controller.nameController,
          isDark: isDark,
        ),
        helper.agreementField(
          label: 'Emergency phone number',
          controller: controller.phoneController,
          isDark: isDark,
          keyboardType: TextInputType.phone,
        ),
        helper.agreementField(
          label: 'Emergency email address',
          controller: controller.emailController,
          isDark: isDark,
          keyboardType: TextInputType.emailAddress,
        ),
        helper.divider(isDark: isDark),
      ],
    );
  }
}
