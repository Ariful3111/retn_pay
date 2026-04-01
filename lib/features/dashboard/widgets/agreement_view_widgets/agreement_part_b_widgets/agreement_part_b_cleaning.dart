import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartBCleaning extends StatelessWidget {
  const AgreementPartBCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text:
              'The rental provider must not require the renter to arrange professional cleaning or cleaning to a professional standard at the end of the tenancy, unless:',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),

        SizedBox(height: 8.h),

        CustomBulletPointText(
          items: [
            'Professional cleaning or cleaning to a professional standard was carried out to the rented premises immediately before the start of the tenancy and the renter was advised that professional cleaning or cleaning to a professional standard had been carried out to those premises immediately before the start of the tenancy; or',
            'Professional cleaning or cleaning to a professional standard is required to restore the rented premises to the same condition they were in immediately before the start of the tenancy, having regard to the condition report and taking into account fair wear and tear.',
          ],
        ),

        SizedBox(height: 12.h),

        CustomTextSecondary(
          text:
              'The renter must have all or part of the rented premises professionally cleaned or pay the cost of having all or part of the rented premises professionally cleaned, if professional cleaning becomes required to restore the premises to the condition they were in immediately before the start of the tenancy, having regard to the condition report and taking into account fair wear and tear.',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 16.h,),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }
}
