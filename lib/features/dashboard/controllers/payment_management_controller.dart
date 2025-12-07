import 'package:get/state_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class PaymentManagementController extends GetxController {
  final List paymentType = [
    'Upcoming Payments',
    'Payment History',
    'Payment Overdue',
    'Set Payment Method',
  ];
  RxInt paymentTypeIndex = 0.obs;
  final List paymentHistoryColumn = [
    'Property Address',
    'Payment Date',
    'Receipt',
  ];

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
}
