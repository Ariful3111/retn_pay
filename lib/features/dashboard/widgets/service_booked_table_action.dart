import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceBookedTableAction extends StatelessWidget {
  const ServiceBookedTableAction({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.serviceBookedDetails);
      },
      child: Container(
        height: 34.h,
        width: 83.h,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color:isDark? AppColors.darkPrimary:AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.r, color:isDark? AppColors.darkBorderPrimary:AppColors.primaryBorder),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: AppColors.buttonShadowColor.withValues(alpha: 0.06),
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CustomTextSecondary(text: 'Details',fontSize: 12.sp,),Image.asset(IconsPath.serviceDetails,height: 16.h,width: 16.w,)],
        ),
      ),
    );
  }
}
