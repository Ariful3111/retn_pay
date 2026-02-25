import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/calender_model.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_event_list.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomEventCalender extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusDay;
  final bool Function(DateTime day) isSameDay;
  final void Function(DateTime day, DateTime focus) onDaySelected;
  final Map<DateTime, List<CalenderEntry>> event;
  final List<CalenderEntry> eventList;
  const CustomEventCalender({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.focusDay,
    required this.isSameDay,
    required this.onDaySelected,
    required this.event,
    required this.eventList,
  });

  DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TableCalendar(
            rowHeight: 45,
            firstDay: firstDay,
            lastDay: lastDay,
            headerVisible: false,
            availableGestures: AvailableGestures.none,
            focusedDay: focusDay,
            selectedDayPredicate: isSameDay,
            onDaySelected: onDaySelected,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, _) {
                final list = event[normalize(day)];
                if (list != null && list.isNotEmpty) {
                  return _coloredDate(day.day, _colorForType(list.first.type));
                }
                return null;
              },
            ),
            calendarStyle: CalendarStyle(
              selectedTextStyle: textDecoration(
                color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              ),
              selectedDecoration: BoxDecoration(
                gradient: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              cellMargin: EdgeInsets.all(4.r),
              defaultTextStyle: textDecoration(
                color: isDark ? AppColors.darkAppBar : null,
              ),
              todayTextStyle: textDecoration(color: AppColors.borderColor),
              outsideTextStyle: textDecoration(
                color: isDark ? AppColors.borderColor : Color(0xFF525E6F),
              ),
              weekendTextStyle: textDecoration(
                color: isDark ? AppColors.darkAppBar : null,
              ),
              rangeHighlightColor: Color(0xFFD1B1C5),
              withinRangeTextStyle: textDecoration(
                color: AppColors.borderColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        CustomCalenderEventList(events: eventList),
      ],
    );
  }

  textDecoration({double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.darkContainer,
    );
  }

  Widget _coloredDate(int day, Color color) {
    return Container(
      margin: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: CustomTextSecondary(text: '$day', color: color),
    );
  }

  Color _colorForType(String? type) {
    if (type == 'property_inspection') {
      return Colors.cyan;
    }
    return Colors.purple;
  }
}
