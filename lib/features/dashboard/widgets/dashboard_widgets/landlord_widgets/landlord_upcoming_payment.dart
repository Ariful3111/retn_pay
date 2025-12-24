import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordUpcomingPayment extends StatelessWidget {
  const LandlordUpcomingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.all(16.r),
          height: 66.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isDark?AppColors.darkSecondary:AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextPrimary(text: 'Upcoming Payment',fontSize: 20.sp,),
              CustomFilterAppbar(onTap: () {
                
              },)
          ],),
        ),
        SizedBox(height: 12.h,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: isDark?AppColors.darkSecondary:AppColors.whiteColor,
          ),
          
        ) 
      ],
    );
  }
}