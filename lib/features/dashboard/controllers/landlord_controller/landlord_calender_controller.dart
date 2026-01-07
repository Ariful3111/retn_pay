import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;

  DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  late final Map<DateTime, List<CalendarEvent>> events;

  @override
  void onInit() {
    super.onInit();
    events = _dummyEvents;
  }

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
    selectedDay.value =
        DateTime(focused.year, focused.month, selectedDay.value.day);
  }

  /// Dummy events (multiple months)
  final Map<DateTime, List<CalendarEvent>> _dummyEvents = {
    // CURRENT MONTH
    DateTime.now(): [
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

    // NEXT MONTH
    DateTime(DateTime.now().year, DateTime.now().month + 1, 10): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
  };
}
