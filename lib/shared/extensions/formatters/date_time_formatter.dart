import 'package:intl/intl.dart';

extension DateTimeFormatterX on String? {
  String toDMMMyyyy({String fallback = ''}) {
    final raw = this;
    if (raw == null) return fallback;
    final value = raw.replaceAll('`', '').trim();
    if (value.isEmpty || value.toLowerCase() == 'null') return fallback;

    DateTime? parsed;
    try {
      parsed = DateFormat('yyyy-MM-dd HH:mm:ss').parse(value);
    } catch (_) {
      parsed = DateTime.tryParse(value);
    }
    if (parsed == null) return fallback.isEmpty ? value : fallback;

    return DateFormat('d MMM, yyyy').format(parsed);
  }
}
