import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';

class AgreementPartDAccess extends StatelessWidget {
  const AgreementPartDAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBulletPointText(
          items: ['The rental provider may enter the premises:'],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomBulletPointText(
            items: [
              'at any time, if the renter has agreed within the last 7 days.',
              'to do an inspection but not more than once every 6 months.',
              'to comply with the rental provider\'s duties under the Act.',
              'to show the premises or conduct an open inspection to sell, rent or value the premises.',
              'to take images or video for advertising a property that is for sale or rent.',
              'if they believe the renter has failed to follow their duties under the Act.',
              'to do a pre-termination inspection where the renter has applied to have the agreement terminated because of family violence or personal violence.',
            ],
            title: ['-', '-', '-', '-', '-', '-', '-'],
          ),
        ),
        CustomBulletPointText(
          items: [
            'The renter must allow entry to the premises where the rental provider has followed proper procedure.',
            'The renter is entitled to a set amount of compensation for each sales inspection.',
          ],
        ),
      ],
    );
  }
}
