import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

mixin ProfileSharedItem {
  Widget rowItem(
    String image,
    String title,
    double imageHeight,
    double imageWidth,
    VoidCallback onTap,
  ) {
    return ProfileItems(
      height: 100.h,
      width: 191.w,
      padding: EdgeInsets.only(left: 12.w, top: 16.5, bottom: 16.5),
      primaryWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              color: Color(0xFFFFEEF8),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
              child: Image.asset(image, height: imageHeight, width: imageWidth),
            ),
          ),
          SizedBox(height: 5.h),
          CustomTextPrimary(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}