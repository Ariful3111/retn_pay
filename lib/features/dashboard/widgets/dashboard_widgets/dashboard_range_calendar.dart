import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardRangeCalendar extends StatelessWidget {
  const DashboardRangeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Obx(
      () => CustomTableCalender(
        firstDay: dashboardController.firstDay,
        lastDay: dashboardController.lastDay,
        focusedDay: dashboardController.focusedDay.value,
        calendarFormat: dashboardController.calendarFormat.value,
        rangeSelectionMode: dashboardController.rangeSelectionMode.value,
        rangeEndDay: dashboardController.rangeEnd.value,
        rangeStartDay: dashboardController.rangeStart.value,
        onDaySelected: (DateTime selectDay, DateTime focus) {
          dashboardController.focusedDay.value = focus;
          dashboardController.selectedDay.value = selectDay;
          dashboardController.rangeStart.value = null;
          dashboardController.rangeEnd.value = null;
          dashboardController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOff;
        },
        onRangeSelected: (DateTime? start, DateTime? end, DateTime focus) {
          dashboardController.rangeStart.value = start;
          dashboardController.rangeEnd.value = end;
          dashboardController.focusedDay.value = focus;
          dashboardController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOn;
        },
        onPageChanged: (DateTime day) {
          dashboardController.focusedDay.value = day;
        },
        onFormatChanged: (format) {
          if (dashboardController.calendarFormat.value != format) {
            dashboardController.calendarFormat.value = format;
          }
        },
        selectDay: dashboardController.selectedDay.value,
      ),
    );
  }
}
