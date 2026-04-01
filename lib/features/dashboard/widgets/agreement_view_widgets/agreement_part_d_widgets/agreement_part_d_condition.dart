import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartDCondition extends StatelessWidget {
  const AgreementPartDCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Rental Provider
        CustomTextPrimary(
          text: 'The rental provider:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),

        SizedBox(height: 8.h),

        CustomBulletPointText(
          items: [
            'must ensure that the premises comply with the rental minimum standards, and is vacant and reasonably clean when the renter moves in.',
            'must maintain the premises in good repair and in a fit condition for occupation.',
            'agrees to do all the safety-related maintenance and repair activities set out in Part C of the agreement.',
          ],
        ),

        SizedBox(height: 16.h),

        /// Renter
        CustomTextPrimary(
          text: 'The renter:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),

        SizedBox(height: 8.h),

        CustomBulletPointText(
          items: [
            'must follow all safety-related activities set out in Part C of the agreement and not remove, deactivate or interfere with safety devices on the premises.',
          ],
        ),
      ],
    );
  }
}
