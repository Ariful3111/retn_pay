// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:renter_pay/core/constants/colors.dart';
// import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
// import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CustomEventCalender extends StatelessWidget {
//   const CustomEventCalender({super.key});

//   DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);

//   @override
//   Widget build(BuildContext context) {
//     LandlordCalenderController landlordCalenderController = Get.find();
//     bool isDark = Theme.of(context).brightness == Brightness.dark;
//     return Column(
//       children: [
//         Obx(() {
//           return Container(
//             height: 252.h,
//             padding: EdgeInsets.all(16.r),
//             decoration: BoxDecoration(
//               color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
//               borderRadius: BorderRadius.circular(12.r),
//             ),
//             child: TableCalendar(
//               rowHeight: 33,
//               firstDay: DateTime(2020),
//               lastDay: DateTime(2030),
//               headerVisible: false,
//               focusedDay: landlordCalenderController.focusedDay.value,
//               selectedDayPredicate: (day) =>
//                   isSameDay(day, landlordCalenderController.selectedDay.value),
//               onDaySelected: landlordCalenderController.onDaySelected,
//               onPageChanged: landlordCalenderController.onMonthChanged,
//               calendarBuilders: CalendarBuilders(
//                 defaultBuilder: (context, day, _) {
//                   final list =
//                       landlordCalenderController.events[normalize(day)];
//                   if (list != null && list.isNotEmpty) {
//                     return _coloredDate(day.day, list.first.color);
//                   }
//                   return null;
//                 },
//               ),
//               calendarStyle: CalendarStyle(
//                 cellMargin: EdgeInsets.all(4.r),
//                 defaultTextStyle: textDecoration(
//                   color: isDark ? AppColors.darkAppBar : null,
//                 ),
//                 todayTextStyle: textDecoration(color: AppColors.borderColor),
//                 outsideTextStyle: textDecoration(
//                   color: isDark ? AppColors.borderColor : Color(0xFF525E6F),
//                 ),
//                 weekendTextStyle: textDecoration(
//                   color: isDark ? AppColors.darkAppBar : null,
//                 ),
//                 rangeHighlightColor: Color(0xFFD1B1C5),
//                 withinRangeTextStyle: textDecoration(
//                   color: AppColors.borderColor,
//                 ),
//               ),
//             ),
//           );
//         }),
//         SizedBox(height: 16),
//         SizedBox(
//           height: 420,
//           child: Obx(() {
//             final events = landlordCalenderController.selectedEvents;
//             if (events.isEmpty) {
//               return const Center(child: Text('No Events'));
//             }
//             return _eventList(events);
//           }),
//         ),
//       ],
//     );
//   }

//   textDecoration({double? fontSize, FontWeight? fontWeight, Color? color}) {
//     return GoogleFonts.inter(
//       fontSize: fontSize ?? 16.sp,
//       fontWeight: fontWeight ?? FontWeight.w500,
//       color: color ?? AppColors.darkContainer,
//     );
//   }

//   Widget _coloredDate(int day, Color color) {
//     return Container(
//       margin: const EdgeInsets.all(6),
//       decoration: BoxDecoration(
//         color: color.withValues(alpha: 0.15),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       alignment: Alignment.center,
//       child: CustomTextSecondary(text: '$day', color: color),
//     );
//   }

//   Widget _eventList(List<CalendarEvent> events) {
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (_, i) {
//         final e = events[i];
//         return Container(
//           margin: const EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Row(
//             children: [
//               Container(width: 6, height: 110, color: e.color),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${e.title}:',
//                         style: TextStyle(
//                           color: e.color,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text(e.subtitle),
//                       const SizedBox(height: 8),
//                       Text(
//                         DateFormat('MMM dd, yyyy - hh:mm a').format(e.date),
//                         style: TextStyle(
//                           color: Colors.pink.shade700,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
