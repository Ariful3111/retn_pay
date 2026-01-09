import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_range_calendar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentManagementController paymentManagementController = Get.find();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFilterAppbar(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomCalenderFilter(
                      widget: PaymentRangeCalendar(),
                      isDay: paymentManagementController.isDay.value,
                      onTap: (int index) {
                        paymentManagementController.isDay.value = index;
                        calenderFilter(
                        index: index,
                        selectedDay: paymentManagementController.selectedDay,
                        rangeStart: paymentManagementController.rangeStart,
                        rangeEnd: paymentManagementController.rangeEnd,
                        rangeSelectionMode:
                            paymentManagementController.rangeSelectionMode,
                      );
                      }, onApply: () {  },
                    );
                  },
                );
              },
            ),
            SizedBox(width: 8.w),
            CustomFilterAppbar(
              title: 'Export',
              icon: IconsPath.export,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
