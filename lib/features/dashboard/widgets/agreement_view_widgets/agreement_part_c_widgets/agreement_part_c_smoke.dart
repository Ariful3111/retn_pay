import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartCSmoke extends StatelessWidget {
  const AgreementPartCSmoke({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(text: '(a) The rental provider must ensure that:'),
        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'any smoke alarm is correctly installed and in working condition;',
            'any smoke alarm is tested according to the manufacturer instructions at least once every 12 months;',
            'the batteries in each smoke alarm are replaced as required.',
          ],
          title: ['1. ', '2. ', '3. '],
        ),
        SizedBox(height: 16.h),
        title(
          text:
              '(b) The rental provider must immediately arrange for a smoke alarm to be repaired or replaced as an urgent repair if they are notified by the renter that it is not in working order.',
        ),
        SizedBox(height: 8.h),
        AgreementHelper().richText(
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          spanColor: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          title: 'Note:',
          spantext:
              ' Repair or replacement of a hard-wired smoke alarm must be undertaken by a suitably qualified person.',
        ),
        SizedBox(height: 16.h),
        title(
          text:
              '(c)The rental provider, on or before the commencement of the agreement, must provide the renter with the following information in writing:',
        ),
        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'Information on how each smoke alarm in the rented premises operates;',
            'Information on how to test each smoke alarm in the rented premises;',
            'Information on the renter\'s obligations to not tamper with any smoke alarms and to report if a smoke alarm in the rented premises is not in working order.',
          ],
          title: ['1. ', '2. ', '3. '],
        ),

        SizedBox(height: 16.h),
        title(
          text:
              '(d)The renter must give written notice to the rental provider as soon as practicable after becoming aware that a smoke alarm in the rented premises is not in working order.',
        ),
        SizedBox(height: 8.h),

        AgreementHelper().richText(
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          spanColor: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          title: 'Note:',
          spantext:
              'Regulations made under the Building Act 1993 require smoke alarms to be installed in all residential buildings.',
        ),
        SizedBox(height: 16.h),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }

  Widget title({required String text}) {
    return CustomTextPrimary(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
