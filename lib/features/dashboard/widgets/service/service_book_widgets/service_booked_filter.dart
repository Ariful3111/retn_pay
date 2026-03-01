import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceBookedFilter extends GetWidget<ServiceBookedController> {
  const ServiceBookedFilter({super.key});

  @override
  Widget build(BuildContext context) {
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
                      firstDay: controller.firstDay,
                      lastDay: controller.lastDay,
                      focusedDay: controller.focusedDay.value,
                      calendarFormat: controller.calendarFormat.value,
                      rangeSelectionMode: controller.rangeSelectionMode.value,
                      rangeEndDay: controller.rangeEnd.value,
                      rangeStartDay: controller.rangeStart.value,
                      onDaySelected: (DateTime selectDay, DateTime focus) {
                        if (controller.isDay.value != 6) {
                          controller.isDay.value = 6;
                          controller.rangeSelectionMode.value =
                              RangeSelectionMode.toggledOn;
                        }
                        controller.focusedDay.value = focus;
                        controller.selectedDay.value = selectDay;
                        controller.rangeStart.value = null;
                        controller.rangeEnd.value = null;
                      },
                      onRangeSelected:
                          (DateTime? start, DateTime? end, DateTime focus) {
                            if (controller.isDay.value != 6) {
                              controller.isDay.value = 6;
                            }
                            controller.rangeStart.value = start;
                            controller.rangeEnd.value = end;
                            controller.focusedDay.value = focus;
                            controller.rangeSelectionMode.value =
                                RangeSelectionMode.toggledOn;
                          },
                      onPageChanged: (DateTime day) {
                        controller.focusedDay.value = day;
                      },
                      onFormatChanged: (format) {
                        if (controller.calendarFormat.value != format) {
                          controller.calendarFormat.value = format;
                        }
                      },
                      selectDay: controller.selectedDay.value,
                    ),

                    isDay: controller.isDay.value,
                    onTap: (int index) {
                      controller.isDay.value = index;
                      calenderFilter(
                        index: index,
                        selectedDay: controller.selectedDay,
                        rangeStart: controller.rangeStart,
                        rangeEnd: controller.rangeEnd,
                        rangeSelectionMode: controller.rangeSelectionMode,
                        focusedDay: controller.focusedDay,
                      );
                    },
                    onApply: () {
                      controller.applyDateFilter();
                      Get.back();
                    },
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
