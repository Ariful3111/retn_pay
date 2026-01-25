import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceRequestSubmit extends StatelessWidget {
  const ServiceRequestSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSecondaryButton(
          width: 125.w,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            children: [
              Icon(Icons.add, color: AppColors.borderColor, size: 14.sp),
              SizedBox(width: 4.w),
              CustomTextSecondary(
                text: 'Add New',
                color: AppColors.borderColor,
              ),
            ],
          ),
          onPressed: () {},
        ),
        SizedBox(height: 28.h),
        Center(
          child: CustomPrimaryButton(
            height: 40.h,
            width: 152.w,
            borderRadius: BorderRadius.circular(6.r),
            text: 'Submit Request',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SuccessDialog(
                    height: 250.h,
                    title1: 'Service Request Submitted',
                    subtitle:
                        'Your request has been successfully\nsubmitted for processing.',
                    button: CustomPrimaryButton(
                      height: 40.h,
                      width: 100.w,
                      borderRadius: BorderRadius.circular(6.r),
                      text: 'Close',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
