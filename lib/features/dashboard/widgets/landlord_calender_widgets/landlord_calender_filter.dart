import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class LandlordCalenderFilter extends StatelessWidget {
  const LandlordCalenderFilter({super.key});

  @override
  Widget build(BuildContext context) {
    LandlordCalenderController landlordCalenderController = Get.find();
    return Obx(
      () => CustomTableCalender(
        firstDay: landlordCalenderController.firstDay,
        lastDay: landlordCalenderController.lastDay,
        focusedDay: landlordCalenderController.focusedDay.value,
        calendarFormat: landlordCalenderController.calendarFormat.value,
        rangeSelectionMode: landlordCalenderController.rangeSelectionMode.value,
        rangeEndDay: landlordCalenderController.rangeEnd.value,
        rangeStartDay: landlordCalenderController.rangeStart.value,
        onDaySelected: (DateTime selectDay, DateTime focus) {
          landlordCalenderController.isDay.value = 6;
          landlordCalenderController.focusedDay.value = focus;
          landlordCalenderController.selectedDay.value = selectDay;
          landlordCalenderController.rangeStart.value = null;
          landlordCalenderController.rangeEnd.value = null;
          landlordCalenderController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOn;
        },
        onRangeSelected: (DateTime? start, DateTime? end, DateTime focus) {
           landlordCalenderController.isDay.value = 6;
          landlordCalenderController.rangeStart.value = start;
          landlordCalenderController.rangeEnd.value = end;
          landlordCalenderController.focusedDay.value = focus;
          landlordCalenderController.rangeSelectionMode.value =
              RangeSelectionMode.toggledOn;
        },
        onPageChanged: (DateTime day) {
          landlordCalenderController.focusedDay.value = day;
        },
        onFormatChanged: (format) {
          if (landlordCalenderController.calendarFormat.value != format) {
            landlordCalenderController.calendarFormat.value = format;
          }
        },
        selectDay: landlordCalenderController.selectedDay.value,
      ),
    );
  }
}
