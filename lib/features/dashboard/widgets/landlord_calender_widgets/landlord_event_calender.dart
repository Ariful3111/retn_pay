import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_event_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class LandlordEventCalender extends StatelessWidget {
  const LandlordEventCalender({super.key});

  @override
  Widget build(BuildContext context) {
    LandlordCalenderController landlordCalenderController = Get.find();
    return Obx(
      () => CustomEventCalender(
        firstDay: landlordCalenderController.firstDay,
        lastDay: landlordCalenderController.lastDay,
        focusDay: landlordCalenderController.focusedDay.value,
        isSameDay: (DateTime day) {
          return isSameDay(day, landlordCalenderController.selectedDay.value);
        },
        event: landlordCalenderController.entriesByDay,
        eventList: landlordCalenderController.entries,
        onDaySelected: (DateTime day, DateTime focus) {
          landlordCalenderController.onDaySelected(day, focus);
        },
      ),
    );
  }
}
