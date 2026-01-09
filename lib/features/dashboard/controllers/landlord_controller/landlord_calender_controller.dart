import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

RxList<CalendarEvent> filteredEvents = <CalendarEvent>[].obs; // NEW
String get selectedMonthLabel {
  final df = DateFormat('MMMM, yyyy');

  // RANGE SELECTED
  if (rangeStart.value != null && rangeEnd.value != null) {
    final start = rangeStart.value!;
    final end = rangeEnd.value!;

    // Same month & year
    if (start.year == end.year && start.month == end.month) {
      return df.format(start);
    }

    return '${df.format(start)} - ${df.format(end)}';
  }

  // SINGLE DAY SELECTED
  return df.format(selectedDay.value);
}
  /// Call this when Apply is clicked
  void applyFilter() {
    DateTime start;
    if (rangeStart.value != null) {
      start = rangeStart.value!;
    } else {
      start = selectedDay.value;
    }

    // Track the month and year of selected date
    int month = start.month;
    int year = start.year;

    // Filter events in that month
    filteredEvents.value = events.entries
        .where((entry) => entry.key.month == month && entry.key.year == year)
        .expand((entry) => entry.value)
        .toList();

    // Focus the calendar to the start of that month
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
    events = _dummyEvents;
    super.onInit();
  }

  DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  late final Map<DateTime, List<CalendarEvent>> events;

  /// selected date events
  List<CalendarEvent> get selectedEvents {
    return events[normalize(selectedDay.value)] ?? [];
  }

  /// date click
  void onDaySelected(DateTime day, DateTime focused) {
    selectedDay.value = day;
    focusedDay.value = focused;
  }

  /// 👉 month swipe (left / right)
  void onMonthChanged(DateTime focused) {
    focusedDay.value = focused;

    /// Optional:
    /// when month changes, auto select first day of that month
    selectedDay.value = DateTime(
      focused.year,
      focused.month,
      selectedDay.value.day,
    );
  }

  final Map<DateTime, List<CalendarEvent>> _dummyEvents = {
    DateTime(DateTime.now().year, DateTime.now().month, 18): [
      CalendarEvent(
        title: 'Today Inspection',
        subtitle: 'Inspection scheduled for today',
        date: DateTime.now().add(const Duration(hours: 2)),
        color: Colors.blue,
      ),
      CalendarEvent(
        title: 'Today Inspection',
        subtitle: 'Inspection scheduled for today',
        date: DateTime.now().add(const Duration(hours: 2)),
        color: Colors.blue,
      ),
    ],

    // PREVIOUS MONTH
    DateTime(DateTime.now().year, DateTime.now().month - 1, 18): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.orange,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 1, 5): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.orange,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 2, 23): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.orange,
      ),
    ],

    // NEXT MONTH
    DateTime(DateTime.now().year, DateTime.now().month + 2, 4): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month + 1, 6): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month + 3, 10): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month + 1, 15): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
  };
}
