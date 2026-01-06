import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/upcoming_payment_status.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UpcomingPaymentInfo extends StatelessWidget {
  final Widget? widget;
  const UpcomingPaymentInfo({super.key, this.widget});

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
                  CustomTextSecondary(
                    text: detailList[index]['title'],
                    color: isDark
                        ? AppColors.darkLightText
                        : AppColors.secondaryTextColor,
                  ),
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
              CustomTextSecondary(
                text: 'Auto Pay:',
                color: isDark
                    ? AppColors.darkLightText
                    : AppColors.secondaryTextColor,
              ),
              CustomSwitchButton(
                isOn: dashboardController.isAutoPay.value,
                onChanged: (value) {
                  dashboardController.isAutoPay.value = value;
                },
              ),
            ],
          ),
        ),
        UpcomingPaymentStatus(widget: widget),
      ],
    );
  }
}
