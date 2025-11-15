import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 48.h,
          width: 326.w,
          padding: EdgeInsets.only(left: 16.w,right: 14.50,top: 12.h,bottom: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(width: 1.sp,color: AppColors.secondaryBorder),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 25.sp,
                spreadRadius: 0,
                color: AppColors.darkPrimary.withValues(alpha: 0.10),
              ),
            ]
          ),
          child: CustomTextField( 
            controller: homeController.searchController,
            prefixIcon:  Image.asset(IconsPath.homeSearch,height: 24.h,width: 24.w,),
            suffixIcon: Image.asset(IconsPath.homeMic,height: 24.h,width: 24.w,),
            labelText: 'Search...',
            isFilled: false,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (context){
              return Stack(
                children: [
                  Positioned(
                    top: 110.h,
                    right: 20.w,
                    child: CustomFilter())
                ],
              );
            });
          },
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(width: 1.sp,color: AppColors.secondaryBorder),
              gradient: AppColors.primaryColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 20.sp,
                  spreadRadius: 0,
                  color: AppColors.darkPrimary.withValues(alpha: 0.10),
                ),
              ]
            ),
            child: Center(
              child: Image.asset(IconsPath.homeFilter,height: 18.h,width: 18.w,),
            ),
          ),
        ),
      ],
    );
  }
}