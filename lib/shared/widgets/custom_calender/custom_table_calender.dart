import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final DateTime? rangeEndDay;
  final DateTime? rangeStartDay;
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final Function(DateTime?, DateTime?, DateTime)? onRangeSelected;
  final Function(DateTime, DateTime)? onDaySelected;
  final Function(CalendarFormat)? onFormatChanged;
  final Function(DateTime)? onPageChanged;
  final DateTime selectDay;
  const CustomTableCalender({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    this.rangeEndDay,
    this.rangeStartDay,
    required this.calendarFormat,
    required this.rangeSelectionMode,
    this.onRangeSelected,
    this.onDaySelected,
    this.onFormatChanged,
    this.onPageChanged,
    required this.selectDay,
  });

  @override
  Widget build(BuildContext context) {
    final weekDay = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constrains) {
        double totalHeight = constrains.maxHeight;
        double headerHeight = 70.h;
        double weekBarHeight = 30.h;
        double remainingHeight = totalHeight - headerHeight - weekBarHeight;
        double rowHeight = remainingHeight / 6;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4.72),
                blurRadius: 16.52,
                color: AppColors.dropShadowColor.withValues(alpha: .10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: TableCalendar(
              firstDay: firstDay,
              lastDay: lastDay,
              focusedDay: focusedDay,
              calendarFormat: calendarFormat,
              rangeSelectionMode: rangeSelectionMode,
              rangeStartDay: rangeStartDay,
              rangeEndDay: rangeEndDay,
              onDaySelected: onDaySelected,
              onRangeSelected: onRangeSelected,
              onPageChanged: onPageChanged,
              onFormatChanged: onFormatChanged,
              rowHeight: rowHeight,
              daysOfWeekHeight: weekBarHeight,
              selectedDayPredicate: (day) => isSameDay(day, selectDay),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                headerMargin: EdgeInsets.zero,
                headerPadding: EdgeInsets.zero,
                titleTextStyle: textDecoration(
                  fontSize: 16.sp,
                  color: isDark ? AppColors.darkAppBar : null,
                ),
                leftChevronIcon: icon(
                  icon: IconsPath.calendarLeft,
                  context: context,
                ),
                rightChevronIcon: icon(
                  icon: IconsPath.calendarRight,
                  context: context,
                ),
              ),
              sixWeekMonthsEnforced: false,
              daysOfWeekVisible: true,
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.all(2.r),
                selectedTextStyle: textDecoration(
                  color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
                ),
                selectedDecoration: BoxDecoration(
                  gradient: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: textDecoration(
                  color: isDark ? AppColors.darkAppBar : null,
                ),
                todayTextStyle: textDecoration(color: AppColors.borderColor),
                outsideTextStyle: textDecoration(
                  color: isDark ? AppColors.borderColor : Color(0xFF525E6F),
                ),
                weekendTextStyle: textDecoration(
                  color: isDark ? AppColors.darkAppBar : null,
                ),
                rangeHighlightColor: Color(0xFFD1B1C5),
                withinRangeTextStyle: textDecoration(
                  color: AppColors.borderColor,
                ),
                todayDecoration: BoxDecoration(shape: BoxShape.rectangle),
                rangeEndTextStyle: textDecoration(color: AppColors.borderColor),
                rangeStartTextStyle: textDecoration(
                  color: AppColors.borderColor,
                ),
                rangeStartDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD1B1C5),
                ),
                rangeEndDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD1B1C5),
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: textDecoration(
                  fontSize: 12.sp,
                  color: isDark ? AppColors.borderColor : Color(0xFF525E6F),
                ),
                weekdayStyle: textDecoration(
                  fontSize: 12.sp,
                  color: isDark ? AppColors.borderColor : Color(0xFF525E6F),
                ),
                dowTextFormatter: (date, locale) {
                  return weekDay[date.weekday % 7];
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget icon({required String icon, required BuildContext context}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 26.72,
      width: 26.72,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(3.34.r),
        border: Border.all(
          width: 0.83.r,
          color: isDark ? AppColors.darkBorderPrimary : Color(0xFFD8DAE5),
        ),
      ),
      child: Center(
        child: Image.asset(
          icon,
          height: 10.h,
          width: 10.w,
          color: isDark ? AppColors.darkAppBar : Color(0xFF051B44),
        ),
      ),
    );
  }

  textDecoration({double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Color(0xFF051B44),
    );
  }
}
