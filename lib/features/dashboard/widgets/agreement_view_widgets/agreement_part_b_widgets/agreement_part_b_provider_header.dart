import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class AgreementPartBProviderHeader extends StatelessWidget {
  const AgreementPartBProviderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBulletPointText(
          color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          items: [
            'The rental provider must permit a fee-free method (other than the renter\'s own bank fees) payment and must allow the renter to use Centrepay or another form of electronic funds transfer.',
            'The renter is entitled to receive a receipt from the rental provider confirming payment of rent.',
          ],
        ),
        SizedBox(height: 12.h),
        CustomTextSpan(
          title: 'Rental Payment Method:',
          spantext: ' RentChip',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkContainer,
          spanColor: AppColors.darkContainer,
        ),
        SizedBox(height: 16.h),
        CustomTextSecondary(
          text: 'Late Payment Policy:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 12.h),
        AgreementHelper().section(
          isDark: isDark,
          title: 'Purpose',
          child: CustomTextSecondary(
            text:
                'This policy outlines the terms and conditions regarding late rental payments to ensure fair and consistent treatment for all tenants and timely collection of rent.',
            fontSize: 14.sp,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          ),
        ),

        AgreementHelper().section(
          isDark: isDark,
          title: 'Rent Due Date',
          child: CustomTextSecondary(
            text:
                'Rent is due every fortnight. Payments not received by 09:01 am on the due date are considered late.',
            fontSize: 14.sp,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          ),
        ),
        AgreementHelper().section(
          isDark: isDark,
          title: 'Late Fees',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text:
                    'If rent is not received by the due date (including any grace period), the following late fees apply:',
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
                  'A late fee of \$30 will be charged on the following day.',
                  'An additional \$15 per day may be charged for each additional day the rent remains unpaid, up to a maximum period of 1 month',
                ],
              ),
            ],
          ),
        ),
        AgreementHelper().section(
          isDark: isDark,
          title: 'Communication',
          child: CustomTextSecondary(
            text:
                'Tenants are encouraged to communicate with management before the rent due date if they anticipate difficulty in making payment. Failure to notify may result in immediate enforcement of late fees and other actions.',
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
