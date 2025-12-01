import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final DateTime ?rangeEndDay;
  final DateTime ?rangeStartDay;
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final bool Function(DateTime)? selectedDayPredicate;
  final Function(DateTime?, DateTime?, DateTime)? onRangeSelected;
  final Function(DateTime, DateTime)? onDaySelected;
  final Function(CalendarFormat)? onFormatChanged;
  final Function(DateTime)? onPageChanged;
  final double rowHeight;
  final double weekHeight;
  final HeaderStyle headerStyle;
  final bool  sixWeekMonthsEnforced;
  final bool daysOfWeekVisible;
  final CalendarStyle calendarStyle;
  final DaysOfWeekStyle daysOfWeekStyle;
  const CustomTableCalender({super.key, required this.firstDay, required this.lastDay, required this.focusedDay, this.selectedDayPredicate, this.rangeEndDay, this.rangeStartDay, required this.calendarFormat, required this.rangeSelectionMode, this.onRangeSelected, this.onDaySelected, this.onFormatChanged, this.onPageChanged, required this.rowHeight, required this.weekHeight, required this.headerStyle, required this.sixWeekMonthsEnforced, required this.daysOfWeekVisible, required this.calendarStyle, required this.daysOfWeekStyle,});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: firstDay,
      lastDay: lastDay,
      selectedDayPredicate: selectedDayPredicate,
      rangeEndDay: rangeEndDay,
      rangeStartDay: rangeStartDay,
      calendarFormat: calendarFormat,
      rangeSelectionMode: rangeSelectionMode,
      onDaySelected: onDaySelected,
      onRangeSelected: onRangeSelected,
      onFormatChanged: onFormatChanged,
      onPageChanged: onPageChanged,
      rowHeight: rowHeight,
      headerStyle: headerStyle,
      daysOfWeekHeight: weekHeight,
      sixWeekMonthsEnforced: sixWeekMonthsEnforced,
      calendarStyle: calendarStyle,
      daysOfWeekStyle: daysOfWeekStyle,
      daysOfWeekVisible: daysOfWeekVisible,
    );
  }
}
