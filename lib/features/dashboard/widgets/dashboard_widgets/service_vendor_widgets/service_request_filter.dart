import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceRequestFilter extends StatelessWidget {
  const ServiceRequestFilter({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceVendorDashboardController serviceVendorDashboardController =
        Get.find();
    return Obx(
      () => CustomTableCalender(
        firstDay: serviceVendorDashboardController.firstDay,
        lastDay: serviceVendorDashboardController.lastDay,
        focusedDay: serviceVendorDashboardController.focusedDay.value,
        calendarFormat: serviceVendorDashboardController.calendarFormat.value,
        rangeSelectionMode:
            serviceVendorDashboardController.rangeSelectionMode.value,
        rangeEndDay: serviceVendorDashboardController.rangeEnd.value,
        rangeStartDay: serviceVendorDashboardController.rangeStart.value,
        onDaySelected: (DateTime selectDay, DateTime focus) {
          if (serviceVendorDashboardController.isDay.value != 6) {
            serviceVendorDashboardController.isDay.value = 6;
            serviceVendorDashboardController.rangeSelectionMode.value =
                RangeSelectionMode.toggledOn;
          }
          serviceVendorDashboardController.focusedDay.value = focus;
          serviceVendorDashboardController.rangeStart.value = null;
          serviceVendorDashboardController.rangeEnd.value = null;
        },
        onRangeSelected: (DateTime? start, DateTime? end, DateTime focus) {
          if (serviceVendorDashboardController.isDay.value != 6) {
            serviceVendorDashboardController.isDay.value = 6;
          }
          serviceVendorDashboardController.rangeStart.value = start;
          serviceVendorDashboardController.rangeEnd.value = end;
          serviceVendorDashboardController.focusedDay.value = focus;
          serviceVendorDashboardController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOn;
        },
        onPageChanged: (DateTime day) {
          serviceVendorDashboardController.focusedDay.value = day;
        },
        onFormatChanged: (format) {
          if (serviceVendorDashboardController.calendarFormat.value != format) {
            serviceVendorDashboardController.calendarFormat.value = format;
          }
        },
        selectDay: serviceVendorDashboardController.selectedDay.value,
      ),
    );
  }
}
