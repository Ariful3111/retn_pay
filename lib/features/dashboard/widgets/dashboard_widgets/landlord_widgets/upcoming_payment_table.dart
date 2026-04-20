import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/upcoming_payment_data.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class UpcomingPaymentTable extends GetWidget<UpcomingPaymentController> {
  const UpcomingPaymentTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : controller.upcomingPayments.value?.data?.isEmpty ?? true
          ? SizedBox()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkTableHead
                        : AppColors.tableHead,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      _headerText('Property Address', flex: 3),
                      _headerText('Due Date', flex: 2),
                      _headerText('Amount', flex: 0),
                    ],
                  ),
                ),
                UpcomingPaymentData(),
              ],
            );
    });
  }

  Widget _headerText(
    String text, {
    required int flex,
    bool alignRight = false,
  }) {
    return Expanded(
      flex: flex,
      child: CustomTextSecondary(
        text: text,
        textAlign: alignRight ? TextAlign.right : TextAlign.left,
      ),
    );
  }
}
