import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_landlord_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
DashboardLandlordController dashboardLandlordController = Get.find();
List<CartesianSeries<dynamic, dynamic>> series = [
  SplineAreaSeries(
    dataSource: dashboardLandlordController.data,
    xValueMapper: (d, _) => d.month,
    yValueMapper: (d, _) => d.p1 / 1000,
    enableTooltip: false,
    enableTrackball: false,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFF68C3).withValues(alpha: 31.73),
        Color(0xFFFEE3F3).withValues(alpha: 0.01),
      ],
    ),
    isVisibleInLegend: false,
  ),
  SplineAreaSeries(
    dataSource: dashboardLandlordController.data,
    xValueMapper: (d, _) => d.month,
    yValueMapper: (d, _) => d.p2 / 1000,
    enableTooltip: false,
    enableTrackball: false,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF68FCFF).withValues(alpha: 31.73),
        Color(0xFFE3FDFE).withValues(alpha: 0.01),
      ],
    ),
    isVisibleInLegend: false,
  ),

  SplineSeries<ChartData, String>(
    name: 'Property 1',
    dataSource: dashboardLandlordController.data,
    xValueMapper: (ChartData d, _) => d.month,
    yValueMapper: (ChartData d, _) => d.p1 / 1000,
    color: AppColors.primaryColorDark,
    width: 1.55.w,
    markerSettings: MarkerSettings(isVisible: false),
  ),

  SplineSeries<ChartData, String>(
    name: 'Property 2',
    dataSource: dashboardLandlordController.data,
    xValueMapper: (ChartData d, _) => d.month,
    yValueMapper: (ChartData d, _) => d.p2 / 1000,
    color: Color(0xFF337778),
    width: 1.55.w,
    markerSettings: MarkerSettings(isVisible: false),
  ),
];
