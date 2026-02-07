import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

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
  final selectedDay = DateTime.now().obs;
  RxInt isDay = 0.obs;
  RxInt checkedIndex = (-1).obs;
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  RxInt isItemSelect = 0.obs;

  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    super.onInit();
  }

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
  List paymentTableColumn = ['Property Address', 'Due Date', 'Amount'];
  List paymentTableData = [
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
    UpcomingModel(
      address: '987 Birch Boulevard',
      date: '1 Aug, 2025',
      amount: '\$450',
    ),
  ];
}
