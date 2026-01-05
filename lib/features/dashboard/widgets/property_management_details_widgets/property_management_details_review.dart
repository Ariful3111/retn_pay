import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementDetailsReview extends StatelessWidget {
  const PropertyManagementDetailsReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: isDark
                ? LinearGradient(
                    colors: [AppColors.darkPrimary, AppColors.darkPrimary],
                  )
                : AppColors.userBackground,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(ImagesPath.profile),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextPrimary(
                        text: 'Ariful Islam',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 8.h),
                      CustomRatingBar(
                        rating: 5,
                        ratingColor: AppColors.primaryColorDark,
                        image: IconsPath.star,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              CustomTextSecondary(text: 'Very professional and always quick to respond to any issues. Made the move-in process seamless.',fontSize: 12.sp,fontWeight: FontWeight.w400,)
            ],
          ),
        );
      }),
    );
  }
}
