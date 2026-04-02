import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartCActivities extends StatelessWidget {
  const AgreementPartCActivities({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text:
              'This safety-related activity only applies if the rented premises contains any appliances, fixtures or fittings which use or supply gas.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        CustomBulletPointText(
          items: [
            'The rental provider must ensure a gas safety check is conducted every two years by a licensed or registered gasfitter of all gas installations and fittings in the rented premises and must provide the renter with the date of the most recent safety check, in writing, on request of the renter.',
            'If a gas safety check has not been conducted within the last two years at the time the renter occupies the premises, the rental provider must arrange a gas safety check as soon as practicable.',
          ],
          title: ['1. ', '2. '],
        ),
        SizedBox(height: 16.h),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }
}
