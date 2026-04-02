import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartDPremises extends StatelessWidget {
  const AgreementPartDPremises({super.key});

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
            'is entitled to quiet enjoyment of the premises. The rental provider may only enter the premises in accordance with the Act.',
            'must not use the premises for illegal purposes.',
            'must not cause a nuisance or interfere with the reasonable peace, comfort or privacy of neighbours.',
            'must avoid damaging the premises and common areas. Common areas include hallways, driveways, gardens and stairwells. Where damage occurs, the renter must notify the rental provider in writing.',
            'must keep the premises reasonably clean.',
          ],
        ),
      ],
    );
  }
}
