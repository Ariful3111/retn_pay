import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/widgets/inspection_property_image.dart';
import 'package:renter_pay/shared/widgets/appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';

class InspectionFrom extends StatelessWidget {
  const InspectionFrom({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gradient: isDark?LinearGradient(colors: [
        AppColors.darkPrimary,
        AppColors.darkPrimary,
      ]):AppColors.userBackground.withOpacity(0.50),

      child: ListView(
      children: [
        Row(
          children: [
            CustomAppbarLeading(onTap: () {
              Get.back();
            },),
            SizedBox(width: 8.w,),
            CustomAppbar(title: 'Inspection Request'),
          ],
        ),
        SizedBox(height: 24.h,),
        InspectionPropertyImage(),
        SizedBox(height: 20.h,),
        CustomTextPrimary(text: 'Inspection Request Form',fontSize: 20.sp,color: AppColors.primaryColorDark,)
      ],
    ),);
  }
}