import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/feedback_dialog.dart';

class LandlordInspectionViewDialog extends StatelessWidget {
  const LandlordInspectionViewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedbackDialog(
      title: 'Completion Feedback',
      subtitle: 'Leave a Remark',
      controller: TextEditingController(),
      button: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSecondaryButton(
            onPressed: () {
              Navigator.pop(context);
            },
            height: 40.h,
            width: 85.w,
            text: 'Cancel',
            borderRadius: BorderRadius.circular(6.r),
          ),
          SizedBox(width: 16.w),
          CustomPrimaryButton(
            borderRadius: BorderRadius.circular(6.r),
            height: 40.h,
            width: 87.w,
            text: 'Submit',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
