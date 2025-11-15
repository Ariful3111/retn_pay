import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/home/widgets/favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 580.h,
      width: MediaQuery.widthOf(context),
      child: GridView.builder(
        
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 189/284
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
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
                CustomText.secondaryText(
                  text: 'Maple Grove Garden',
                  color: AppColors.whiteColor,
                ),
                Row(
                  children: [
                    Image.asset(IconsPath.location, height: 14.h, width: 14.w),
                    SizedBox(width: 4.w),
                    CustomText.secondaryText(
                      text: 'New York, USA',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor.withValues(alpha: 0.75),
                    ),
                  ],
                ),
                CustomText.spanText(
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
