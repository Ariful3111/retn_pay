import 'package:flutter/material.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';

final Map<DateTime, List<CalendarEvent>> dummyEvents = {
    DateTime(DateTime.now().year, DateTime.now().month, 18): [
      CalendarEvent(
        title: 'Today Inspection',
        subtitle: 'Inspection scheduled for today',
        date: DateTime.now().add( Duration(hours: 2)),
        color: Colors.blue,
      ),
      CalendarEvent(
        title: 'Today Inspection',
        subtitle: 'Inspection scheduled for today',
        date: DateTime.now().add(const Duration(hours: 2)),
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, 15): [
      CalendarEvent(
        title: 'Today Inspection',
        subtitle: 'Inspection scheduled for today',
        date: DateTime.now().add( Duration(hours: 2)),
        color: Colors.yellow,
      ),
      CalendarEvent(
        title: 'Today Inspection',
        subtitle: 'Inspection scheduled for today',
        date: DateTime.now().add(const Duration(hours: 2)),
        color: Colors.green,
      ),
    ],

    DateTime(DateTime.now().year, DateTime.now().month - 1, 18): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.yellow,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 1, 8): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.yellow,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 1, 12): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.yellow,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 1, 5): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.teal,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 1, 10): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.teal,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 1, 6): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.teal,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 2, 23): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 2, 15): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month - 2, 8): [
      CalendarEvent(
        title: 'Previous Month Event',
        subtitle: 'Old inspection',
        date: DateTime.now(),
        color: Colors.green,
      ),
    ],

    DateTime(DateTime.now().year, DateTime.now().month + 2, 4): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month + 1, 6): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month + 3, 10): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month + 1, 15): [
      CalendarEvent(
        title: 'Next Month Event',
        subtitle: 'Upcoming inspection',
        date: DateTime.now(),
        color: Colors.yellow,
      ),
    ],
  };