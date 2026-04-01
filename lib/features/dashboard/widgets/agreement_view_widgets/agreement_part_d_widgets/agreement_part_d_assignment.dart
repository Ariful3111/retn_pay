import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartDAssignment extends StatelessWidget {
  const AgreementPartDAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text: 'The renter:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'Must not assign (transfer to another person) or sub-let the whole or any part of the premises without the written consent of the rental provider.',
          ],
        ),
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text:
              'The rental provider may give the renter notice to vacate if the renter assigns or sublets the premises without consent.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 16.h),
        CustomTextPrimary(
          text: 'The rental provider:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'Cannot unreasonably withhold consent to assign or sub-let the premises.',
            'Must not demand or receive a fee or payment for consent, other than reasonable expenses incurred by the assignment.',
          ],
        ),
      ],
    );
  }
}
