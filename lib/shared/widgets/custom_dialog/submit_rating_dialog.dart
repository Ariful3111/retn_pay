import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SubmitRatingDialog extends StatelessWidget {
  final Widget rating;
  final String ratingTitle;
  final String reviewText;
  final Widget ?cancelButton;
  final Widget ?buttonSpace;
  final VoidCallback onTap;
  const SubmitRatingDialog({super.key, required this.rating, required this.ratingTitle, required this.reviewText, this.cancelButton, this.buttonSpace, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SuccessDialog(
      height: 220.h,
      width: 380.w,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(text: 'Completion Feedback', fontSize: 20.sp),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: 'Rate the  Landlord',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          rating,
          SizedBox(height: 13.h),
          CustomTextSecondary(
            text: 'Leave a Remark',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Container(
              width: MediaQuery.widthOf(context),
              padding: EdgeInsets.symmetric(vertical: 4.9.h, horizontal: 13.08.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.54.r),
                color: isDark
                    ? AppColors.darkSecondary
                    : AppColors.textFieldColor,
              ),
              child: Center(
                child: CustomTextPrimary(
                  text: reviewText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ?cancelButton,
              ?buttonSpace,
              CustomPrimaryButton(
                borderRadius: BorderRadius.circular(6.r),
                height: 40.h,
                width: 162.w,
                text: 'Submit Feedback',
                onPressed: onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
