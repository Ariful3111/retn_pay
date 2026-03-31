import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_provider_header.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartBProvider extends StatelessWidget {
  const AgreementPartBProvider({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AgreementPartBProviderHeader(),
        AgreementHelper().section(
          isDark: isDark,
          title: 'Returned Payments',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text:
                    'If a payment is returned or dishonored, the tenant will be charged:',
                fontSize: 14.sp,
                color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
              ),
              SizedBox(height: 6.h),
              CustomBulletPointText(
                color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
                items: [
                  'A returned payment fee of e.g., \$35,',
                  'Any applicable late fees if rent remains unpaid beyond the due date.',
                ],
              ),
            ],
          ),
        ),
        AgreementHelper().section(
          isDark: isDark,
          title: 'Non-Payment and Eviction',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text:
                    'If rent remains unpaid for more than 14 days after the due date, management reserves the right to:',
                fontSize: 14.sp,
                color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
              ),
              SizedBox(height: 6.h),
              CustomBulletPointText(
                color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
                items: [
                  'Issue a Notice to Vacate / Notice to Remedy,',
                  'Begin eviction proceedings as outlined in the Tenancy Act.',
                ],
              ),
            ],
          ),
        ),

        /// Application of Payments
        AgreementHelper().section(
          isDark: isDark,
          title: 'Application of Payments',
          child: CustomTextSecondary(
            text:
                'All payments received will first be applied to outstanding late fees or other charges before being applied to rent.',
            fontSize: 14.sp,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          ),
        ),

        /// Amendments
        AgreementHelper().section(
          isDark: isDark,
          title: 'Amendments',
          child: CustomTextSecondary(
            text:
                'This policy may be amended by management with proper notice provided to tenants in writing.',
            fontSize: 14.sp,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          ),
        ),
      ],
    );
  }
}
