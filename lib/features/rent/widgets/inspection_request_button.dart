import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/rent/widgets/inspection_verification.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_secondary_button.dart';

class InspectionRequestButton extends StatelessWidget {
  const InspectionRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSecondaryButton(
          onPressed: () {},
          height: 40.h,
          width: 119.w,
          text: 'Virtual Tour',
          borderRadius: BorderRadius.circular(6.r),
        ),
        SizedBox(width: 12.w),
        CustomPrimaryButton(
          height: 40.h,
          width: 176.w,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(child: InspectionVerification());
              },
            );
          },
          text: 'Inspection Request',
          borderRadius: BorderRadius.circular(8.r),
        ),
      ],
    );
  }
}
