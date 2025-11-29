import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_reminder.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class DashboardReminder extends StatelessWidget {
  const DashboardReminder({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.07.w, vertical: 21.79.h),
        decoration: BoxDecoration(
          color: isDark?AppColors.darkPrimary:AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: CustomTextPrimary(text: 'Reminders', fontSize: 20.sp, color: isDark?AppColors.darkAppBar:AppColors.primaryColorDark,),
            ),
            Divider(
              color: isDark?AppColors.darkBorderPrimary:AppColors.whiteBorder,
              thickness: 1,
            ),
            SizedBox(height: 13.07.h,),
            ...List.generate(3, (index) => CustomReminder(),),
          ],
        ),
      ),
    );
  }
}