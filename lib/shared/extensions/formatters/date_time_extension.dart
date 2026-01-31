import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Combines DateTime and TimeOfDay to produce an ISO 8601 string.
  /// Format: yyyy-MM-ddTHH:mm:ssZ
  String toIso8601WithTime(TimeOfDay time) {
    final dateTime = DateTime(year, month, day, time.hour, time.minute);
    // Using DateFormat to ensure correct padding and format
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime);
  }
}
