import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_share_link.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_close_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyShare extends StatelessWidget {
  final PropertyModel property;
  const PropertyShare({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor:isDark? AppColors.darkSecondary:AppColors.whiteColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextPrimary(text: 'Maple Grove Garden House', fontSize: 19.sp),
          CustomCloseButton(
            color: isDark?AppColors.darkPrimary:AppColors.whiteColor,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      constraints: BoxConstraints.tight(
        Size(MediaQuery.widthOf(context), 600.h),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(text: 'Land Data Title: Maple Grove - Lot 23'),
          SizedBox(height: 12.h),
          CustomTextSecondary(text: 'Date of Registration: 2025-07-08'),
          SizedBox(height: 12.h),
          CustomTextSecondary(text: 'Owner Name: John Doe'),
          SizedBox(height: 12.h),
          CustomTextSecondary(text: 'Email: John123@gmail.com'),
          SizedBox(height: 12.h),
          CustomTextSecondary(text: 'Phone No: +1234567890'),
          SizedBox(height: 40.h),
          CustomTextPrimary(text: 'Share', fontSize: 20.sp),
          SizedBox(height: 8.h),
          Row(
            children: [
              Image.asset(IconsPath.shareFacebook, height: 32.h, width: 32.w),
              SizedBox(width: 12.w),
              Image.asset(IconsPath.messenger, height: 32.h, width: 32.w),
              SizedBox(width: 12.w),
              Image.asset(IconsPath.whatsapp, height: 32.h, width: 32.w),
              SizedBox(width: 12.w),
              Image.asset(IconsPath.gmail, height: 32.h, width: 32.w),
            ],
          ),
          SizedBox(height: 20.h),
          PropertyShareLink(),
        ],
      ),

      actions: [
        CustomPrimaryButton(
          height: 40.h,
          width: 140.w,
          borderRadius: BorderRadius.circular(6.r),
          text: 'Share',
          onPressed: () {},
        ),
      ],
    );
  }
}
