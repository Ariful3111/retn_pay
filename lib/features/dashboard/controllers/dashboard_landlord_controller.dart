import 'package:get/get.dart';

class UpcomingModel {
  final String address;
  final String date;
  final String amount;
  UpcomingModel({
    required this.address,
    required this.date,
    required this.amount,
  });
}

class ChartData {
  final String month;
  final double p1;
  final double p2;
  final double p3;

  ChartData(this.month, this.p1, this.p2, this.p3);
}

class DashboardLandlordController extends GetxController {
  RxInt checkedIndex = (-1).obs;
  final List<ChartData> data = [
    ChartData('Mar', 6000, 5200, 4800),
    ChartData('Apr', 6500, 6000, 5800),
    ChartData('May', 4000, 3000, 2800),
    ChartData('Jun', 4000, 3000, 3000),
    ChartData('Jul', 4500, 3500, 3200),
    ChartData('Aug', 4800, 3800, 3500),
    ChartData('Sep', 5200, 4200, 3800),
    ChartData('Oct', 6800, 6000, 5200),
  ];
}
