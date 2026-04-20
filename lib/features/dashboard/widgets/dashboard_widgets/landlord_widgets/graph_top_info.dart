import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/monthly_revenue_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class GraphTopInfo extends GetWidget<MonthlyRevenueController> {
  const GraphTopInfo({super.key});

  // Color palette for property indicators (matching dashboard_graph.dart)
  static const List<Color> _propertyColors = [
    AppColors.primaryColorDark,
    Color(0xFF337778),
    Color(0xFF8B5CF6),
    Color(0xFFF59E0B),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final revenueData = controller.monthlyRevenue.value?.data;

      if (revenueData == null) {
        return const SizedBox.shrink();
      }

      // Calculate total revenue from all series
      double totalRevenue = 0;
      for (var series in revenueData.series) {
        for (var value in series.data) {
          totalRevenue += value;
        }
      }

      // Get current date formatted
      final currentDate = _formatDate(DateTime.now());

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentDate,
                style: GoogleFonts.manrope(
                  fontSize: 9.34.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF636875),
                ),
              ),
              SizedBox(height: 11.h),
              CustomTextPrimary(
                text: '\$${_formatAmount(totalRevenue)}',
                fontSize: 24.sp,
              ),
            ],
          ),
          SizedBox(width: 8.w),
          // Dynamic property legends with wrapping
          Flexible(
            child: Wrap(
              spacing: 8.w,
              runSpacing: 4.h,
              alignment: WrapAlignment.end,
              children: List.generate(revenueData.series.length, (index) {
                final colorIndex = index % _propertyColors.length;
                final propertyName = revenueData.series[index].name;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextPrimary(
                      text: _truncateName(propertyName, 10),
                      fontSize: 10.sp,
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      height: 16.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: _propertyColors[colorIndex],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      );
    });
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  String _formatAmount(double amount) {
    final formatted = amount.toInt().toString();
    return formatted.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (m) => '${m[1]},',
    );
  }

  String _truncateName(String name, int maxLength) {
    if (name.length <= maxLength) return name;
    return '${name.substring(0, maxLength)}...';
  }
}
