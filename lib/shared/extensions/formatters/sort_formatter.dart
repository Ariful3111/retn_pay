/// Converts display sort text to API query format
class SortFormatter {
  /// Converts user-friendly sort text to API-compatible query value
  ///
  /// Examples:
  /// - "Low To High" → "low_to_high"
  /// - "High to Low" → "high_to_low"
  /// - "Latest" → "latest"
  static String toQueryFormat(String displayText) {
    return displayText.trim().toLowerCase().replaceAll(RegExp(r'\s+'), '_');
  }

  /// Converts API query format back to display text
  ///
  /// Examples:
  /// - "low_to_high" → "Low To High"
  /// - "high_to_low" → "High To Low"
  /// - "latest" → "Latest"
  static String toDisplayText(String queryValue) {
    return queryValue
        .trim()
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) =>
              word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }
}
