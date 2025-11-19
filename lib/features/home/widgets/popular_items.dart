import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/home/widgets/favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 284.w,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Container(
            height: 284.h,
            width: 300.w,
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              image: DecorationImage(image: AssetImage(ImagesPath.homePopular),fit: BoxFit.fill)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: FavoriteButton(onTap: () {
                    
                  },)
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.secondaryText(
                      text: 'Maple Grove Garden',
                      color: AppColors.whiteColor,
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
                Row(
                  children: [
                    Image.asset(IconsPath.location,height: 14.h,width: 14.w,),
                    SizedBox(width: 4.w,),
                    CustomText.secondaryText(
                      text: 'New York, USA',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor.withValues(alpha: 0.75),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
