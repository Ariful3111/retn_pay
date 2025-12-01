import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardRangeCalendar extends StatelessWidget {
  const DashboardRangeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final weekDay = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    return LayoutBuilder(
      builder: (context, constrains) {
        double totalHeight = constrains.maxHeight;
        double headerHeight = 65.h;
        double weekBarHeight = 26.h;
        double remainingHeight = totalHeight - headerHeight - weekBarHeight;
        double rowHeight = remainingHeight / 6;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4.72),
                blurRadius: 16.52,
                color: AppColors.dropShadowColor.withValues(alpha: .10),
              ),
            ],
          ),
          child: Obx(
            () => Material(
              color: Colors.transparent,
              child: CustomTableCalender(
                firstDay: dashboardController.firstDay,
                lastDay: dashboardController.lastDay,
                focusedDay: dashboardController.focusedDay.value,
                calendarFormat: dashboardController.calendarFormat.value,
                rangeSelectionMode: dashboardController.rangeSelectionMode.value,
                rangeStartDay: dashboardController.rangeStart.value,
                rangeEndDay: dashboardController.rangeEnd.value,
                onDaySelected: (DateTime selectDay, DateTime focus) {
                  dashboardController.focusedDay.value = focus;
                  dashboardController.rangeStart.value = null;
                  dashboardController.rangeEnd.value = null;
                  dashboardController.rangeSelectionMode.value =
                      RangeSelectionMode.toggledOff;
                },
                onRangeSelected:
                    (DateTime? start, DateTime? end, DateTime focus) {
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
                rowHeight: rowHeight,
                weekHeight: weekBarHeight,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  headerMargin: EdgeInsets.zero,
                  headerPadding: EdgeInsets.zero,
                  titleTextStyle: textDecoration(
                    fontSize: 13.sp,
                  ),
                  leftChevronIcon: icon(icon: IconsPath.calendarLeft),
                  rightChevronIcon: icon(icon: IconsPath.calendarRight),
                ),
                sixWeekMonthsEnforced: false,
                daysOfWeekVisible: true,
                calendarStyle: CalendarStyle(
                  defaultTextStyle: textDecoration(),
                  todayTextStyle: textDecoration(color: AppColors.borderColor),
                  outsideTextStyle: textDecoration(
                    color: Color(0xFF525E6F)
                  ),
                  weekendTextStyle: textDecoration(),
                  rangeHighlightColor: Color(0xFFD1B1C5),
                  withinRangeTextStyle: textDecoration(
                    color: AppColors.borderColor
                  ),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  rangeEndTextStyle: textDecoration(
                    color: AppColors.borderColor
                  ),
                  rangeStartTextStyle: textDecoration(color: AppColors.borderColor),
                  rangeStartDecoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFD1B1C5)),
                  rangeEndDecoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFD1B1C5)),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: textDecoration(
                    fontSize: 8.35.sp,
                    color: Color(0xFF525E6F),
                  ),
                  weekdayStyle: textDecoration(
                    fontSize: 8.35.sp,
                    color: Color(0xFF525E6F),
                  ),
                  dowTextFormatter: (date, locale) {
                    return weekDay[date.weekday % 7];

                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget icon({required String icon}) {
    return Container(
      height: 26.72,
      width: 26.72,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(3.34.r),
        border: Border.all(width: 0.83.r, color: Color(0xFFD8DAE5)),
      ),
      child: Center(
        child: Image.asset(
          icon,
          height: 10.h,
          width: 10.w,
          color: Color(0xFF051B44),
        ),
      ),
    );
  }
  textDecoration({
    double? fontSize,
    FontWeight? fontWeight,
    Color ?color,
  }){
    return GoogleFonts.inter(
                    fontSize:fontSize?? 11.69.sp,
                    fontWeight:fontWeight?? FontWeight.w500,
                    color:color?? Color(0xFF051B44)
                  );
  }
}
