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

  List paymentTableColumn = ['Property Address', 'Due Date', 'Amount'];
}
