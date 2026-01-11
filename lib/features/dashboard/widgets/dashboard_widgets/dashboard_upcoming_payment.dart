import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/upcoming_payment_info.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class DashboardUpcomingPayment extends StatelessWidget {
  final Widget? widget;
  const DashboardUpcomingPayment({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    
    List imageList = [ImagesPath.house, ImagesPath.studio, ImagesPath.office];

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MediaQuery(
      data: MediaQueryData(
        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPrimary(
              text:'Upcoming Payment',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.darkAppBar : AppColors.primaryColorDark,
            ),
            SizedBox(height: 16.42.h),
            Row(
              children: List.generate(imageList.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: index == 2 ? 0 : 12.w),
                  height: 82.11.h,
                  width: 102.63.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageList[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.21.r),
                  ),
                );
              }),
            ),
            UpcomingPaymentInfo(widget: widget),
          ],
        ),
      ),
    );
  }
}
