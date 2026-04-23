import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SubmitRatingDialog extends StatelessWidget {
  final Widget rating;
  final String ratingTitle;
  final String? reviewText;
  final Widget? cancelButton;
  final Widget? buttonSpace;
  final VoidCallback onTap;
  final bool writeReview;
  final int? maxLines;
  final double? height;
  final double? fieldHeight;
  final TextEditingController? controller;
  final bool? isAlignLabelWithHint;
  const SubmitRatingDialog({
    super.key,
    required this.rating,
    required this.ratingTitle,
    this.reviewText,
    this.cancelButton,
    this.buttonSpace,
    required this.onTap,
    required this.writeReview,
    this.controller,
    this.maxLines,
    this.height,
    this.fieldHeight,
    this.isAlignLabelWithHint,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SuccessDialog(
      isBG: false,
      height: height ?? 220.h,
      width: 380.w,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(text: 'Completion Feedback', fontSize: 20.sp),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: ratingTitle,
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
          writeReview
              ? SizedBox(
                  height: fieldHeight ?? 44.h,
                  child: CustomTextField(
                    controller: controller!,
                    labelText: 'Write Your Review',
                    maxLines: maxLines,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    padding: EdgeInsets.zero,
                    isAlignLabelWithHint: isAlignLabelWithHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.54.r),
                      borderSide: BorderSide.none,
                    ),
                    enableBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.54.r),
                      borderSide: BorderSide.none,
                    ),
                    focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.54.r),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: isDark ? AppColors.darkSecondary : null,
                  ),
                )
              : Expanded(
                  child: Container(
                    width: MediaQuery.widthOf(context),
                    padding: EdgeInsets.symmetric(
                      vertical: 4.9.h,
                      horizontal: 13.08.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.54.r),
                      color: isDark
                          ? AppColors.darkSecondary
                          : AppColors.textFieldColor,
                    ),
                    child: Center(
                      child: CustomTextPrimary(
                        text: reviewText.toString(),
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
