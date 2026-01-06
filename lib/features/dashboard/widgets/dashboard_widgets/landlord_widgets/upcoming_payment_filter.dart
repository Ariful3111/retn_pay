import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landrord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class UpcomingPaymentFilter extends StatelessWidget {
  const UpcomingPaymentFilter({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardLandlordController dashboardLandlordController = Get.find();
    return Obx(
      () => CustomTableCalender(
        firstDay: dashboardLandlordController.firstDay,
        lastDay: dashboardLandlordController.lastDay,
        focusedDay: dashboardLandlordController.focusedDay.value,
        calendarFormat: dashboardLandlordController.calendarFormat.value,
        rangeSelectionMode: dashboardLandlordController.rangeSelectionMode.value,
        rangeEndDay: dashboardLandlordController.rangeEnd.value,
        rangeStartDay: dashboardLandlordController.rangeStart.value,
        onDaySelected: (DateTime selectDay, DateTime focus) {
          dashboardLandlordController.focusedDay.value = focus;
          dashboardLandlordController.rangeStart.value = null;
          dashboardLandlordController.rangeEnd.value = null;
          dashboardLandlordController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOff;
        },
        onRangeSelected: (DateTime? start, DateTime? end, DateTime focus) {
          dashboardLandlordController.rangeStart.value = start;
          dashboardLandlordController.rangeEnd.value = end;
          dashboardLandlordController.focusedDay.value = focus;
          dashboardLandlordController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOn;
        },
        onPageChanged: (DateTime day) {
          dashboardLandlordController.focusedDay.value = day;
        },
        onFormatChanged: (format) {
          if (dashboardLandlordController.calendarFormat.value != format) {
            dashboardLandlordController.calendarFormat.value = format;
          }
        },
      ),
    );
  }
}
