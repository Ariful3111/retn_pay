import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_provider_agent.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_provider_details.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartAProvider extends GetWidget<AgreementPartAController> {
  const AgreementPartAProvider({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rental Provider Details Section
          helper.agreementField(
            label: 'Full name(s) or Company name',
            controller: controller.rentalProviderNameController,
            isDark: isDark,
          ),
          helper.agreementField(
            label: 'ABN (if applicable)',
            controller: controller.rentalProviderABNController,
            isDark: isDark,
            keyboardType: TextInputType.number,
          ),
          CustomTextSecondary(
            text:
                '(Please fill out details below where no agent is acting for the rental provider)',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.darkContainer,
          ),
          SizedBox(height: 16.h),
          AgreementPartAProviderDetails(),
          AgreementPartAProviderAgent(),
          SizedBox(height: 16.h),
          helper.richText(
            title: 'Note: ',
            spantext:
                'The rental provider must notify the renter within 7 days if any of this information changes.',
          ),

          SizedBox(height: 16.h),
          helper.divider(isDark: isDark),
        ],
      ),
    );
  }
}
