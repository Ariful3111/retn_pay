import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/calender_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomCalenderEventList extends StatelessWidget {
  final List<CalenderEntry> events;
  const CustomCalenderEventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (events.isEmpty) {
      return Align(
        alignment: Alignment.topCenter,
        child: CustomTextPrimary(text: 'No Events', fontSize: 20.sp),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      // height: MediaQuery.heightOf(context),
      // width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: events.length,
        itemBuilder: (_, i) {
          final e = events[i];
          final color = _colorForType(e.type);
          final start = DateTime.tryParse(e.startDatetime ?? '');
          final local = start == null
              ? null
              : (start.isUtc ? start.toLocal() : start);
          return Container(
            margin: EdgeInsets.only(bottom: 16.r),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 30,
                  color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 8.w,
                  height: 132.h,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextSecondary(
                          text: '${e.title ?? ''}:',
                          color: color,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextPrimary(
                          text: e.description ?? '',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextSecondary(
                          text: local == null
                              ? ''
                              : DateFormat(
                                  'MMM dd, yyyy - hh:mm a',
                                ).format(local),
                          color: AppColors.borderColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _colorForType(String? type) {
    if (type == 'property_inspection') {
      return Colors.cyan;
    }
    return Colors.purple;
  }
}
