import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/active_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/submit_review_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/rating.dart';

class ActivePropertyRating extends StatelessWidget {
  const ActivePropertyRating({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ActivePropertyController activePropertyController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.h,
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: isDark?AppColors.darkPrimary :AppColors.whiteColor,
            border: Border.all(width: 1.r, color:isDark? AppColors.darkBorderPrimary:AppColors.secondaryBorder),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2,
                color: Color(0xFFE4E5E7).withValues(alpha: 0.24),
              ),
            ],
          ),
          child: Rating(
            onRating: (value) {
              activePropertyController.rating.value = value;
            },
            initialRating: activePropertyController.rating.value,
            itemSize: 24.w,
            itemBuilder: (_, _) {
              return Image.asset(IconsPath.star);
            },
          ),
        ),
        SizedBox(height: 30.h),
        CustomPrimaryButton(
          height: 52,
          text: 'Submit Review',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SubmitReviewDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
