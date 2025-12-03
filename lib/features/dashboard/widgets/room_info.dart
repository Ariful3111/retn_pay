import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.only(top: 24.h, left: 24.h,bottom: 24.h),
      height: 313.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: isDark ? AppColors.darkAuthBG : AppColors.userBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoText(text: 'Room'),
          SizedBox(height: 12.h),
          CustomTextSecondary(text: 'Key Images:'),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.h),
                  child: Container(
                    height: 52.h,
                    width: 52.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(image: AssetImage(ImagesPath.house),fit: BoxFit.cover)
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24.h,),
          CustomTextSecondary(text: 'Room/Door name:'),
          SizedBox(height: 4.h,),
          infoText(text: 'SKS Tower'),
          SizedBox(height: 20.h,),
          CustomTextSecondary(text: 'Date:'),
          SizedBox(height: 4.h,),
          infoText(text: '12 October, 2025')
        ],
      ),
    );
  }

  Widget infoText({required String text}) {
    return CustomTextPrimary(
      text: text,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
