import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/feedback_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementReassignment extends StatelessWidget {
  const PropertyManagementReassignment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFilterAppbar(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return FeedbackDialog(
              title: 'Reassignment Request',
              subtitle: 'Request Reason',
              controller: TextEditingController(),
              button: Align(
                alignment: Alignment.center,
                child: CustomPrimaryButton(
                  height: 40.h,
                  width: 87.w,
                  text: 'Submit',
                  borderRadius: BorderRadius.circular(6.r),
                  onPressed: () {}),
              ),
            );
          },
        );
      },
      child: Center(
        child: CustomTextSecondary(text: 'Reassignment', fontSize: 12.sp),
      ),
    );
  }
}
