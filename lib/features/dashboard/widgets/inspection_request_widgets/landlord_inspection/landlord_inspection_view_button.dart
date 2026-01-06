import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';

class LandlordInspectionViewButton extends StatelessWidget {
  const LandlordInspectionViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPrimaryButton(onPressed: () {
          
        },
        height: 52.h,
        width: 127.w,
        text: 'Approved',
        borderRadius: BorderRadius.circular(8.r),
        ),
        SizedBox(width: 20.w,),
        CustomSecondaryButton(onPressed: () {
          
        },
        height: 52.h,
        width: 127.w,
        text: 'Decline',
        borderRadius: BorderRadius.circular(8.r),
        )
      ],
    );
  }
}