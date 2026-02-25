extension ExperienceExtractor on String {
  (String title, String subTitle) extractExperienceParts() {
    final normalized = trim().replaceAll(RegExp(r'\s+'), ' ');
    if (normalized.isEmpty) return ('', '');

    final match = RegExp(r'^([0-9]+(?:\.[0-9]+)?\+?)\s+(.*)$').firstMatch(
      normalized,
    );
    if (match != null) {
      return (match.group(1) ?? '', (match.group(2) ?? '').trim());
    }

    final firstSpaceIndex = normalized.indexOf(' ');
    if (firstSpaceIndex > 0) {
      final firstToken = normalized.substring(0, firstSpaceIndex).trim();
      final rest = normalized.substring(firstSpaceIndex + 1).trim();
      final looksNumeric = RegExp(r'^[0-9]').hasMatch(firstToken);
      if (looksNumeric) return (firstToken, rest);
    }

    return ('', normalized);
  }
}
