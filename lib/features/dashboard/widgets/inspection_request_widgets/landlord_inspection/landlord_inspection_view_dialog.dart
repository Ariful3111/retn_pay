import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordInspectionViewDialog extends StatelessWidget {
  const LandlordInspectionViewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      isBG: false,
      height: 220.h,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(text: 'Completion Feedback', fontSize: 20.sp),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: 'Leave a Remark',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          CustomTextField(controller: TextEditingController()),
          SizedBox(height: 25.h),
          Row(
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
        ],
      ),
    );
  }
}
