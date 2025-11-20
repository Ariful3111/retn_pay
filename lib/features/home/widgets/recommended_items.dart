import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/home/widgets/favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text_span.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 284.h,
      width: MediaQuery.widthOf(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 284.h,
            width: 189.w,
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.only(
              left: 12.w,
              right: 8.w,
              top: 8.h,
              bottom: 12.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              image: DecorationImage(
                image: AssetImage(ImagesPath.homeRecommended),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: FavoriteButton(onTap: (){}),
                ),
                Spacer(),
                CustomTextSecondary(
                  text: 'Maple Grove Garden',
                  color: AppColors.whiteColor,
                ),
                Row(
                  children: [
                    Image.asset(IconsPath.location, height: 14.h, width: 14.w),
                    SizedBox(width: 4.w),
                    CustomTextSecondary(
                      text: 'New York, USA',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor.withValues(alpha: 0.75),
                    ),
                  ],
                ),
                CustomTextSpan(
                  title: '\$200',
                  spantext: '/Week',
                  fontSize: 16.sp,
                  spanFontSize: 12.sp,
                  spanFontWeight: FontWeight.w400,
                  color: AppColors.whiteColor,
                  spanColor: AppColors.darkSecondaryText,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
