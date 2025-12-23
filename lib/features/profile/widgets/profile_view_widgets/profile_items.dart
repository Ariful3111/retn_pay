import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ProfileItems extends StatelessWidget {
  final double ?height;
  final double ?width;
  final Widget ?primaryWidget;
  final Widget ?secondaryWidget;
  final VoidCallback onTap;
  final double ?imageHeight;
  final double ?imageWidth;
  final String ?image;
  final String ?title;
  final EdgeInsets ?padding;
  const ProfileItems({super.key, this.height, this.width, this.primaryWidget, this.secondaryWidget,required this.onTap,  this.imageHeight,  this.imageWidth,  this.image,  this.title, this.padding});
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height??60.h,
        width: width??MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color:themeController.isDarkMode.value?AppColors.darkSecondary :AppColors.whiteColor,
          border: Border.all(width: 1.sp,color:themeController.isDarkMode.value? AppColors.darkBorderPrimary:Color(0xFFF2F2F2),),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: primaryWidget??Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 12.w,),
            Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                color: Color(0xFFFFEEF8),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Center(child: Image.asset(image!,height: imageHeight,width: imageWidth,),),
            ),
            SizedBox(width: 8.h,),
           CustomTextPrimary(text: title??'',fontSize: 16.sp,fontWeight: FontWeight.w400,),
            Spacer(),
            ?secondaryWidget,
            SizedBox(width: 18.w,),
          ],
        ),
      ),
    );
  }
}