import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';

class TextModel extends StatelessWidget {
  final String text;
  final void Function(int reference) onTap;

  const TextModel({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final segments = parseTextWithReferences(text);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return RichText(
      text: TextSpan(
        children: segments.map((segment) {
          if (!segment.isReference) {
            return TextSpan(
              text: segment.text,
              style: GoogleFonts.inter(
                color: isDark? AppColors.darkPrimaryText :AppColors.primaryDarkTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.4.h
              ),
            );
          }
          return TextSpan(
            text: segment.text,
            style: GoogleFonts.inter(
              color: AppColors.primaryColorDark,
              fontSize: 14.sp,
                fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){
              onTap(segment.reference!);
            },
          );
        }).toList(),
      ),
    );
  }
}

List<ParsedTextSegment> parseTextWithReferences(String text) {
  final regex = RegExp(r'\[(\d+)\]');
  final List<ParsedTextSegment> segments = [];
  int lastIndex = 0;
  for (final match in regex.allMatches(text)) {
    if (match.start > lastIndex) {
      segments.add(
        ParsedTextSegment(text: text.substring(lastIndex, match.start)),
      );
    }
    segments.add(
      ParsedTextSegment(
        text: match.group(0)!,
        reference: int.parse(match.group(1)!),
      ),
    );

    lastIndex = match.end;
  }
  if (lastIndex < text.length) {
    segments.add(ParsedTextSegment(text: text.substring(lastIndex)));
  }

  return segments;
}
class ParsedTextSegment {
  final String text;
  final int? reference;

  const ParsedTextSegment({required this.text, this.reference});

  bool get isReference => reference != null;
}
