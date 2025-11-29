import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UpcomingPaymentInfo extends StatelessWidget {
  const UpcomingPaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
        DashboardController dashboardController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    List detailList = [
      {'title': 'Property Address:', 'subtitle': '987 Birch Boulevard'},
      {'title': 'Payment Date:', 'subtitle': '2 July, 2025'},
      {'title': 'Monthly Rent:', 'subtitle': '\$450'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(detailList.length, (index) {
            return Column(
              children: [
                SizedBox(height: 12.32.h),
                Row(
                  children: [
                    CustomTextSecondary(text: detailList[index]['title'],color: isDark?AppColors.darkLightText:AppColors.secondaryTextColor,),
                    CustomTextPrimary(
                      text: detailList[index]['subtitle'],
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ],
                ),
              ],
            );
          }),
          SizedBox(height: 12.32.h),
          Obx(
            () => Row(
              children: [
                CustomTextSecondary(text: 'Auto Pay:',color: isDark?AppColors.darkLightText:AppColors.secondaryTextColor,),
                CustomSwitchButton(
                  isOn: dashboardController.isAutoPay.value,
                  onChanged: (value) {
                    dashboardController.isAutoPay.value = value;
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 40.h,
            width: 155.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 28,
                  color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                ),
              ],
            ),
            child: Row(
              children: [
                CustomTextPrimary(
                  text: 'Status:',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 12.w),
                Container(
                  height: 24.h,
                  width: 77.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: isDark ? Color(0xFF382806) : Color(0xFFFFF7E6),
                  ),
                  child: Center(
                    child: CustomTextPrimary(
                      text: 'Pending',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark ? Color(0xFFFFF7E6) : Color(0xFFE89E00),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}