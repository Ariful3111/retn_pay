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

  String toTimeAgo({String fallback = ''}) {
    final raw = this;
    if (raw == null) return fallback;
    final value = raw.replaceAll('`', '').trim();
    if (value.isEmpty || value.toLowerCase() == 'null') return fallback;

    DateTime? parsed;
    try {
      parsed = DateFormat('yyyy-MM-dd HH:mm:ss').parse(value, true);
    } catch (_) {
      parsed = DateTime.tryParse(value);
    }
    if (parsed == null) return fallback.isEmpty ? value : fallback;

    final now = parsed.isUtc ? DateTime.now().toUtc() : DateTime.now();
    final diff = now.difference(parsed);
    if (diff.inSeconds < 0) return fallback.isEmpty ? 'Just now' : fallback;

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 30) return '${diff.inDays}d ago';

    final months = (diff.inDays / 30).floor();
    if (months < 12) return '${months}month ago';

    final years = (diff.inDays / 365).floor();
    return '${years}y ago';
  }
}
