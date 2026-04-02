import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/monthly_revenue_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/graph_top_info.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardGraph extends GetWidget<MonthlyRevenueController> {
  const DashboardGraph({super.key});

  // Color palette for chart lines
  static const List<Color> _lineColors = [
    AppColors.primaryColorDark,
    Color(0xFF337778),
    Color(0xFF8B5CF6),
    Color(0xFFF59E0B),
  ];

  // Gradient colors for area fills
  static const List<List<Color>> _gradientColors = [
    [Color(0xFFFF68C3), Color(0xFFFEE3F3)],
    [Color(0xFF68FCFF), Color(0xFFE3FDFE)],
    [Color(0xFFA78BFA), Color(0xFFEDE9FE)],
    [Color(0xFFFCD34D), Color(0xFFFEF3C7)],
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      if (controller.isLoading.value) {
        return ButtonLoading();
      }

      final revenueData = controller.monthlyRevenue.value?.data;
      if (revenueData == null || revenueData.series.isEmpty) {
        return const SizedBox.shrink();
      }

      return Container(
        margin: EdgeInsets.only(top: 20.h),
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 6.h,
          left: 16.w,
          right: 16.w,
        ),
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
            SizedBox(height: 4.h),
            SfCartesianChart(
              margin: EdgeInsets.zero,
              plotAreaBorderWidth: 0,
              trackballBehavior: TrackballBehavior(
                enable: true,
                lineType: TrackballLineType.none,
                activationMode: ActivationMode.singleTap,
                tooltipSettings: InteractiveTooltip(
                  enable: true,
                  format: 'point.x : point.y',
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
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF636875),
                ),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: _calculateYAxisMax(revenueData),
                interval: _calculateYAxisInterval(revenueData),
                anchorRangeToVisiblePoints: false,
                rangePadding: ChartRangePadding.none,
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                minorTickLines: const MinorTickLines(width: 0),
                minorGridLines: const MinorGridLines(width: 0),
                labelFormat: '{value}k',
                labelStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF636875),
                ),
              ),
              series: _buildSeries(revenueData),
            ),
          ],
        ),
      );
    });
  }

  double _calculateYAxisMax(dynamic revenueData) {
    double maxValue = 0;
    for (var series in revenueData.series) {
      for (var value in series.data) {
        if (value > maxValue) maxValue = value;
      }
    }
    // Convert to thousands and add padding
    final maxK = (maxValue / 1000).ceilToDouble();
    return maxK < 1 ? 1 : maxK + 1;
  }

  double _calculateYAxisInterval(dynamic revenueData) {
    final max = _calculateYAxisMax(revenueData);
    if (max <= 5) return 1;
    if (max <= 10) return 2;
    return 5;
  }

  List<CartesianSeries<dynamic, dynamic>> _buildSeries(dynamic revenueData) {
    List<CartesianSeries<dynamic, dynamic>> chartSeries = [];

    for (int i = 0; i < revenueData.series.length; i++) {
      final seriesData = revenueData.series[i];
      final colorIndex = i % _lineColors.length;

      // Build data points
      final dataPoints = <_ChartDataPoint>[];
      for (int j = 0; j < revenueData.labels.length; j++) {
        final label = revenueData.labels[j];
        final value = j < seriesData.data.length ? seriesData.data[j] : 0.0;
        dataPoints.add(_ChartDataPoint(label, value / 1000));
      }

      // Add SplineAreaSeries (gradient fill)
      chartSeries.add(
        SplineAreaSeries<_ChartDataPoint, String>(
          dataSource: dataPoints,
          xValueMapper: (d, _) => d.month,
          yValueMapper: (d, _) => d.value,
          enableTooltip: false,
          enableTrackball: false,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _gradientColors[colorIndex][0].withValues(alpha: 31.73),
              _gradientColors[colorIndex][1].withValues(alpha: 0.01),
            ],
          ),
          isVisibleInLegend: false,
        ),
      );

      // Add SplineSeries (line)
      chartSeries.add(
        SplineSeries<_ChartDataPoint, String>(
          name: seriesData.name,
          dataSource: dataPoints,
          xValueMapper: (_ChartDataPoint d, _) => d.month,
          yValueMapper: (_ChartDataPoint d, _) => d.value,
          color: _lineColors[colorIndex],
          width: 1.55.w,
          markerSettings: const MarkerSettings(isVisible: false),
        ),
      );
    }

    return chartSeries;
  }
}

class _ChartDataPoint {
  final String month;
  final double value;

  _ChartDataPoint(this.month, this.value);
}
