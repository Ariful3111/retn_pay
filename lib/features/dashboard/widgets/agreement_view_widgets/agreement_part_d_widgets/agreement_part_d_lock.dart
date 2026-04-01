import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartDLock extends StatelessWidget {
  const AgreementPartDLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text: 'The rental provider must ensure the premises:',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomBulletPointText(
            items: [
              'has locks to secure all windows capable of having a lock,',
              'has deadlocks (a deadlock is a deadlatch with at least one cylinder) for external doors that are able to be secured with a functioning deadlock,',
              'meets the rental minimum standards for locks and window locks.',
            ],
            title: ['-', '-', '-'],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPrimary(
              text: '•',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            Expanded(
              child: CustomTextPrimary(
                text:
                    'External doors which are not able to be secured with a functioning deadlock must at least be fitted with a locking device that:',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        SizedBox(height: 8.h),

        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomBulletPointText(
            items: [
              'is operated by a key from the outside;',
              'may be unlocked from the inside with or without a key.',
            ],
            title: ['-', '-'],
          ),
        ),
        SizedBox(height: 16.h),
        CustomBulletPointText(
          items: [
            'The renter must obtain consent from the rental provider to change a lock in the master key system.',
            'The rental provider must not unreasonably refuse consent for a renter seeking to change a lock in the master key system.',
            'The rental provider must not give a key to a person excluded from the premises under a:'
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(left: 16.w),
          child: CustomBulletPointText(
            items: [
              'family violence intervention order;',
              'family violence safety notice;',
              'recognised non-local DVO;',
              'personal safety intervention order.',
            ],
            title: ['-', '-', '-', '-'],
          ),
        ),
      ],
    );
  }
}
