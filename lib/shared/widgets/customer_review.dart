import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 219.h,
        width: MediaQuery.widthOf(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context,index){
        return Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 14.38.w, vertical: 23.96.h),
        height: 219.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.89.r),
          gradient: AppColors.userBackground,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3.72),
              blurRadius: 13.03,
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImagesPath.profile, height: 86.27.h, width: 81.12.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPrimary(
                  text:
                      '"The apartment is stunning! The\nnatural light and spacious rooms\nmake it feel so refreshing. The 24/7\nsecurity gives me peace of mind."',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  width: 252.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextPrimary(
                            text: 'Jems Charter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextSecondary(
                            text: 'Dhaka, Bangladesh',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          RatingBarIndicator(
                            rating: 5,
                            itemCount: 5,
                            itemSize: 12.sp,
                            itemPadding: EdgeInsets.all(1.5.r),
                            itemBuilder: (context,index){
                            return Image.asset(IconsPath.rating,color: AppColors.primaryColorDark,);
                          })
                        ],
                      ),
                      Image.asset(
                        IconsPath.review,
                        height: 33.51.h,
                        width: 37.77.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
      }),
    );
  }
}
