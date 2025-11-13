import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Row(
      children: [
        Container(
          height: 48.h,
          width: 326.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(width: 1.sp,color: AppColors.secondaryBorder),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30.sp,
                color: AppColors.darkPrimary.withValues(alpha: 0.10),
              ),
            ]
          ),
          child: CustomTextField(
            
            controller: homeController.searchController,
            prefixIcon:  Image.asset(IconsPath.homeSearch,height: 24.h,width: 24.w,),
            suffixIcon: Image.asset(IconsPath.homeMic,height: 18.h,width: 23.w,),
            labelText: 'Search...',
          ),
        ),
      ],
    );
  }
}