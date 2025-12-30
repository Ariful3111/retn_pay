import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_graph_line.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/graph_top_info.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardGraph extends StatelessWidget {
  const DashboardGraph({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(top: 16.h, bottom: 6.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1.w,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GraphTopInfo(),
          SizedBox(height: 4.h,),
          SfCartesianChart(
            margin: EdgeInsets.zero,
            plotAreaBorderWidth: 0,
            trackballBehavior: TrackballBehavior(
              enable: true,
              lineType: TrackballLineType.none,
              activationMode: ActivationMode.singleTap,
              tooltipSettings: InteractiveTooltip(
                enable: true,
                format: 'point.x : point.yk',
                canShowMarker: true,
              ),
              markerSettings: TrackballMarkerSettings(
                markerVisibility: TrackballVisibilityMode.visible,
              ),
            ),
            tooltipBehavior: TooltipBehavior(
              color: AppColors.primaryColorDark,
              enable: true,
              builder:
                  (
                    dynamic data,
                    dynamic point,
                    dynamic series,
                    int pointIndex,
                    int seriesIndex,
                  ) {
                    final value = (point.y * 1000).toInt();
                    return Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Text(
                        '\$${value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]},')}',
                        style: GoogleFonts.poppins(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  },
            ),
            primaryXAxis: CategoryAxis(
              rangePadding: ChartRangePadding.none,
              axisLine: AxisLine(width: 0),
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              labelStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF636875),
              ),
            ),
            primaryYAxis: NumericAxis(
              minimum: 1,
              maximum: dashboardLandlordController.data.length - 1,
              interval: 1,
              anchorRangeToVisiblePoints: false,
              rangePadding: ChartRangePadding.none,
              axisLine: AxisLine(width: 0),
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(size: 0),
              minorTickLines: MinorTickLines(width: 0),
              minorGridLines: MinorGridLines(width: 0),
              labelFormat: '{value}k',
              labelStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF636875),
              ),
            ),
            series: series,
          ),
        ],
      ),
    );
  }
}
