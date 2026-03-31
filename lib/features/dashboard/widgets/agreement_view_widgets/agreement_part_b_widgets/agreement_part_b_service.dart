import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b_service_renter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartBService extends StatelessWidget {
  const AgreementPartBService({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextSecondary(
              text: '9.',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: CustomTextSecondary(
                text:
                    'Service of notices and other documents by electronic methods',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        CustomBulletPointText(
          items: [
            'Electronic service of documents must be in accordance with the requirements of the Electronic Transactions (Victoria) Act 2000.',
            'Just because someone responds to an email or other electronic communications, does not mean they have consented to the service of notices and other documents by electronic methods.',
            'The renter and rental provider must notify the other party in writing if they no longer wish to receive notices or other documents by electronic methods.',
            'The renter and the rental provider must immediately notify the other party in writing if their contact details change.',
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextSecondary(
          text:
              '9.1. Does the renter agree to the service of notices and other documents by electronic methods, such as email?',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 4.h),
        CustomTextSecondary(
          text: '(Renter to tick as appropriate)',
          fontSize: 14.sp,
        ),
        SizedBox(height: 16.h),
        AgreementPartBServiceRenter(),
        helper.richText(
          title: 'Note:',
          spantext:
              ' If there are more than four renters, include details on an extra page.',
        ),
        SizedBox(height: 16.h),
        helper.divider(isDark: isDark),
      ],
    );
  }
}
