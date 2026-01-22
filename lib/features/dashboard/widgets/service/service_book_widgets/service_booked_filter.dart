import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceBookedFilter extends StatelessWidget {
  const ServiceBookedFilter({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceBookedController serviceBookedController = Get.find();
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 71.w,
        child: CustomFilterAppbar(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Obx(
                  () => CustomCalenderFilter(
                    alignmentGeometry: Alignment(0, -0.3),
                    widget: CustomTableCalender(
                      firstDay: serviceBookedController.firstDay,
                      lastDay: serviceBookedController.lastDay,
                      focusedDay: serviceBookedController.focusedDay.value,
                      calendarFormat:
                          serviceBookedController.calendarFormat.value,
                      rangeSelectionMode:
                          serviceBookedController.rangeSelectionMode.value,
                      rangeEndDay: serviceBookedController.rangeEnd.value,
                      rangeStartDay: serviceBookedController.rangeStart.value,
                      onDaySelected: (DateTime selectDay, DateTime focus) {
                        if (serviceBookedController.isDay.value != 6) {
                          serviceBookedController.isDay.value = 6;
                          serviceBookedController.rangeSelectionMode.value =
                              RangeSelectionMode.toggledOn;
                        }
                        serviceBookedController.focusedDay.value = focus;
                        serviceBookedController.selectedDay.value = selectDay;
                        serviceBookedController.rangeStart.value = null;
                        serviceBookedController.rangeEnd.value = null;
                      },
                      onRangeSelected:
                          (DateTime? start, DateTime? end, DateTime focus) {
                            if (serviceBookedController.isDay.value != 6) {
                              serviceBookedController.isDay.value = 6;
                            }
                            serviceBookedController.rangeStart.value = start;
                            serviceBookedController.rangeEnd.value = end;
                            serviceBookedController.focusedDay.value = focus;
                            serviceBookedController.rangeSelectionMode.value =
                                RangeSelectionMode.toggledOn;
                          },
                      onPageChanged: (DateTime day) {
                        serviceBookedController.focusedDay.value = day;
                      },
                      onFormatChanged: (format) {
                        if (serviceBookedController.calendarFormat.value !=
                            format) {
                          serviceBookedController.calendarFormat.value = format;
                        }
                      },
                      selectDay: serviceBookedController.selectedDay.value,
                    ),

                    isDay: serviceBookedController.isDay.value,
                    onTap: (int index) {
                      serviceBookedController.isDay.value = index;
                      calenderFilter(
                        index: index,
                        selectedDay: serviceBookedController.selectedDay,
                        rangeStart: serviceBookedController.rangeStart,
                        rangeEnd: serviceBookedController.rangeEnd,
                        rangeSelectionMode:
                            serviceBookedController.rangeSelectionMode,
                        focusedDay: serviceBookedController.focusedDay,
                      );
                    },
                    onApply: () {},
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
