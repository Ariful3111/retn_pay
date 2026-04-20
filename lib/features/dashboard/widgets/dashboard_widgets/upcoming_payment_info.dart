import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/upcoming_payments_model.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/upcoming_payment_status.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UpcomingPaymentInfo extends GetWidget<UpcomingPaymentController> {
  final UpcomingPayment payment;
  final Widget? widget;
  const UpcomingPaymentInfo({super.key, required this.payment, this.widget});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Extract data from payment model
    final property = payment.leaseAgreement?.property;
    final propertyAddress = property?.address ?? 'N/A';
    final paymentDate = payment.nextPaymentDate?.toDMMMyyyy() ?? 'N/A';
    final monthlyRent = payment.amount ?? 'N/A';

    List<Map<String, String>> detailList = [
      {'title': 'Property Address: ', 'subtitle': propertyAddress},
      {'title': 'Payment Date: ', 'subtitle': paymentDate},
      {'title': 'Monthly Rent: ', 'subtitle': '\$$monthlyRent'},
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
                    text: detailList[index]['title']!,
                    color: isDark
                        ? AppColors.darkLightText
                        : AppColors.secondaryTextColor,
                  ),
                  CustomTextPrimary(
                    text: detailList[index]['subtitle']!,
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
                isOn: payment.autoPayEnabled ?? false,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        UpcomingPaymentStatus(widget: widget),
      ],
    );
  }
}
