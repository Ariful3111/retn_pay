import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/active_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/success_dialog.dart';

class SubmitReviewDialog extends StatelessWidget {
  const SubmitReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    ActivePropertyController activePropertyController = Get.find();
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
            text: 'Rate the Landlord',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          Obx(
            () => RatingBarIndicator(
              rating: activePropertyController.rating.value,
              itemCount: 5,
              itemSize: 20.sp,
              itemPadding: EdgeInsets.all(2.r),
              itemBuilder: (_, _) {
                return Image.asset(IconsPath.rating);
              },
            ),
          ),
          SizedBox(height: 13.h),
          CustomTextSecondary(
            text: 'Leave a Remark',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          Container(
            width: MediaQuery.widthOf(context),
            padding: EdgeInsets.symmetric(vertical: 4.9.h, horizontal: 13.08.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.54.r),
              color:isDark? AppColors.darkSecondary:AppColors.textFieldColor,
            ),
            child: Center(
              child: CustomTextPrimary(
                text: activePropertyController.reviewController.text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: CustomPrimaryButton(
              borderRadius: BorderRadius.circular(6.r),
              height: 40.h,
              width: 162.w,
              text: 'Submit Feedback',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
