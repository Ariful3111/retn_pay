import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text_secondary.dart';

class NotificationAppbarActions extends StatelessWidget {
  const NotificationAppbarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 32.h,
          width: 119,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(6.sp),
            border: Border.all(width: 1.sp,color: AppColors.filterBorder),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2.sp,
                spreadRadius: 0.sp,
                color: Color(0xFF525866).withValues(alpha: 0.06),
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(IconsPath.mark,width: 10.64.w,height: 6.04.h,),
              CustomTextSecondary(text: 'Mark as read',fontSize: 12.sp,color: Color(0xFF6B7280)),
            ],
          ),
        );
  }
}