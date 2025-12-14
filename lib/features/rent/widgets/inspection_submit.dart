import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';

class InspectionSubmit extends StatelessWidget {
  const InspectionSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPrimaryButton(
          height: 48.h,
          width: 150.w,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SuccessDialog(
                  title1: 'Your inspection request has been submitted!',
                  subtitle:
                      'Our agent will contact you within 24 hours to confirm your appointment.',
                  button: Row(
                    children: [
                      CustomPrimaryButton(
                        height: 35.h,
                        width: 122.w,
                        borderRadius: BorderRadius.circular(4.27.r),
                        text: 'Back To Property',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 9.w),
                      CustomSecondaryButton(
                        height: 35.h,
                        width: 154.w,
                        borderRadius: BorderRadius.circular(4.27.r),
                        text: 'Browse More Properties',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        onPressed: () {
                          Get.toNamed(AppRoutes.mainHome);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          text: 'Submit Request',
          borderRadius: BorderRadius.circular(7.22.r),
        ),
      ],
    );
  }
}
