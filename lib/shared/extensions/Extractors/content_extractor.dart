enum BlogContentBlockType { heading, paragraph, bullet }

typedef BlogContentBlock = ({BlogContentBlockType type, String text});

extension ContentExtractor on String {
  List<BlogContentBlock> extractBlogContentBlocks() {
    final normalized = replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    final lines = normalized.split('\n');

    final blocks = <BlogContentBlock>[];
    final paragraphBuffer = <String>[];

    void flushParagraph() {
      if (paragraphBuffer.isEmpty) return;

      final text = paragraphBuffer.join(' ').trim();
      paragraphBuffer.clear();

      if (text.isEmpty) return;
      blocks.add((type: BlogContentBlockType.paragraph, text: text));
    }

    for (final rawLine in lines) {
      final line = rawLine.trim();

      if (line.isEmpty) {
        flushParagraph();
        continue;
      }

      final isBullet =
          line.startsWith('- ') ||
          line.startsWith('• ') ||
          line.startsWith('– ') ||
          line.startsWith('* ');
      if (isBullet) {
        flushParagraph();
        final bulletText = line.substring(2).trim();
        if (bulletText.isNotEmpty) {
          blocks.add((type: BlogContentBlockType.bullet, text: bulletText));
        }
        continue;
      }

      final isHeading = line.endsWith(':') && line.length > 1;
      if (isHeading) {
        flushParagraph();
        blocks.add((type: BlogContentBlockType.heading, text: line));
        continue;
      }

      paragraphBuffer.add(line);
    }

    flushParagraph();
    return blocks;
  }
}

extension NotificationSectionTitleX on DateTime {
  String toNotificationSectionTitle() {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);
    final createdDate = DateTime(year, month, day);
    final dayDiff = nowDate.difference(createdDate).inDays;

    if (dayDiff <= 0) return 'Today';
    if (dayDiff == 1) return 'Yesterday';
    if (dayDiff < 30) return '${dayDiff}d ago';

    final months = (dayDiff / 30).floor();
    if (months < 12) return '${months}month ago';

    final years = (dayDiff / 365).floor();
    return '${years}y ago';
  }
}
