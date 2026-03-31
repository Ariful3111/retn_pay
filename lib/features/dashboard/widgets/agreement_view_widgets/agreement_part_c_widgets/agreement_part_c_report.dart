import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';

class AgreementPartCReport extends StatelessWidget {
  const AgreementPartCReport({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomBulletPointText(
          items: [
            'The rental provider must ensure an electrical safety check is conducted every two years by a licensed or registered electrician of all electrical installations, appliances and fittings provided by a rental provider in the rented premises, and must provide the renter with the date of the most recent safety check, in writing, on request of the renter.',
            'If an electrical safety check of the rented premises has not been conducted within the last two years at the time the renter occupies the premises, the rental provider must arrange an electrical safety check as soon as practicable.',
          ],
        ),
         SizedBox(height: 16.h),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }
}
