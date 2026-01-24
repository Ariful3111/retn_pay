import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_management_export.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_range_calendar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';

class PaymentManagementFilter extends StatelessWidget {
  const PaymentManagementFilter({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentManagementController paymentManagementController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomFilterAppbar(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Obx(()=> CustomCalenderFilter(
                  alignmentGeometry: Alignment(0, -0.3),
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
                          paymentManagementController.rangeSelectionMode, focusedDay: paymentManagementController.focusedDay,
                    );
                  },
                  onApply: () {},
                ),);
              },
            );
          },
        ),
        SizedBox(width: 8.w),
        CustomFilterAppbar(
          title: 'Export',
          icon: IconsPath.export,
          onTap: () {
            showDialog(
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) {
                return PaymentManagementExport(
                  exportList: paymentManagementController.exportType,
                  selectedIndex: paymentManagementController.selectedExport,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
