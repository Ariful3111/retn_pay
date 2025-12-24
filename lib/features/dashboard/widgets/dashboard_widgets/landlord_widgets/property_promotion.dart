import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/property_promotion_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class PropertyPromotion extends StatelessWidget {
  const PropertyPromotion({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        width: MediaQuery.widthOf(context),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.basicPlanBG,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPrimary(
              text: 'Free 30-Day Property Promotion!',
              fontSize: 24.sp,
              color: AppColors.primaryColorDark,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 28.h),
            CustomTextSpan(
              title:
                  'Get your property featured on our site & social media — free for 30 days! (T&C apply)',
              fontSize: 16.sp,
              color: AppColors.secondaryTextColor,
              spantext: '*Includes 10-15 photos + 30-45 sec video!',
              spanFontSize: 16.sp,
              spanColor: AppColors.primaryColorDark,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Image.asset(IconsPath.Boster, height: 20.h, width: 20.w),
                SizedBox(width: 4.w),
                CustomTextSecondary(
                  text: 'Boost anytime:',
                  color: AppColors.darkContainer,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            PropertyPromotionButton(),
          ],
        ),
      ),
    );
  }
}
