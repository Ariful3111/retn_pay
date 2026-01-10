import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:renter_pay/shared/widgets/custom_calender/dummy_events.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEvent {
  final String title;
  final String subtitle;
  final DateTime date;
  final Color color;

  CalendarEvent({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });
}

class LandlordCalenderController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt isDay = 0.obs;
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;

RxList<CalendarEvent> filteredEvents = <CalendarEvent>[].obs;
String get selectedMonthLabel {
  final df = DateFormat('MMMM, yyyy');

  if (rangeStart.value != null && rangeEnd.value != null) {
    final start = rangeStart.value!;
    final end = rangeEnd.value!;

    if (start.year == end.year && start.month == end.month) {
      return df.format(start);
    }

    return '${df.format(start)} - ${df.format(end)}';
  }

  return df.format(selectedDay.value);
}

  void applyFilter() {
    DateTime start;
    if (rangeStart.value != null) {
      start = rangeStart.value!;
    } else {
      start = selectedDay.value;
    }

    int month = start.month;
    int year = start.year;

    filteredEvents.value = events.entries
        .where((entry) => entry.key.month == month && entry.key.year == year)
        .expand((entry) => entry.value)
        .toList();
    focusedDay.value = DateTime(year, month, 1);
  }

  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  RxInt isItemSelect = 0.obs;
  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    events = dummyEvents;
    super.onInit();
  }

  DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  late final Map<DateTime, List<CalendarEvent>> events;

  List<CalendarEvent> get selectedEvents {
    return events[normalize(selectedDay.value)] ?? [];
  }

  void onDaySelected(DateTime day, DateTime focused) {
    selectedDay.value = day;
    focusedDay.value = focused;
  }

  void onMonthChanged(DateTime focused) {
    focusedDay.value = focused;
    selectedDay.value = DateTime(
      focused.year,
      focused.month,
      selectedDay.value.day,
    );
  }

  
}
