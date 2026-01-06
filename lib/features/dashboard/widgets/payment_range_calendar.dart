import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class PaymentRangeCalendar extends StatelessWidget {
  const PaymentRangeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentManagementController paymentManagementController = Get.find();
    return Obx(
      () => CustomTableCalender(
        firstDay: paymentManagementController.firstDay,
        lastDay: paymentManagementController.lastDay,
        focusedDay: paymentManagementController.focusedDay.value,
        calendarFormat: paymentManagementController.calendarFormat.value,
        rangeSelectionMode: paymentManagementController.rangeSelectionMode.value,
        rangeEndDay: paymentManagementController.rangeEnd.value,
        rangeStartDay: paymentManagementController.rangeStart.value,
        onDaySelected: (DateTime selectDay, DateTime focus) {
          paymentManagementController.focusedDay.value = focus;
          paymentManagementController.rangeStart.value = null;
          paymentManagementController.rangeEnd.value = null;
          paymentManagementController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOff;
        },
        onRangeSelected: (DateTime? start, DateTime? end, DateTime focus) {
          paymentManagementController.rangeStart.value = start;
          paymentManagementController.rangeEnd.value = end;
          paymentManagementController.focusedDay.value = focus;
          paymentManagementController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOn;
        },
        onPageChanged: (DateTime day) {
          paymentManagementController.focusedDay.value = day;
        },
        onFormatChanged: (format) {
          if (paymentManagementController.calendarFormat.value != format) {
            paymentManagementController.calendarFormat.value = format;
          }
        },
      ),
    );
  }
}
