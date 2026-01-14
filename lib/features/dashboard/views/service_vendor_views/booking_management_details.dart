import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BookingManagementDetails extends StatelessWidget {
  const BookingManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark ? null : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 8.w),
              CustomAppbar(title: 'Booking Management'),
            ],
          ),
          SizedBox(height: 32.h,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 15.w),
            decoration: BoxDecoration(
              color: isDark?AppColors.darkPrimary:AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(children: [
              Image.asset(ImagesPath.service,height: 211.h,width: MediaQuery.widthOf(context),),
              SizedBox(height: 12.h,),
              Row(
            children: [
              Image.asset(IconsPath.service, height: 33.83.h, width: 33.83.w),
              SizedBox(width: 9.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPrimary(
                      text: 'ProFix Plumbing Solutions',
                      fontSize: 20.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkContainer,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextSecondary(
                      text: 'Expert Plumbing Services for Homes & Businesses',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
            ],),
          ),
        ],
      ),
    );
  }
}
