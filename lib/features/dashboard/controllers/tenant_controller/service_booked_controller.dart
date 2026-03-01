import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';
import 'package:renter_pay/features/dashboard/repositories/booked_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceBookedController extends GetxController {
  final BookedListRepository bookedListRepository;
  ServiceBookedController({required this.bookedListRepository});
  final bookings = Rxn<BookingListModel>();
  RxBool isLoading = true.obs;
  final selectedDay = DateTime.now().obs;
  RxInt isDay = 0.obs;
  RxInt isBookedType = 0.obs;
  final List bookedTypeList = ['Scheduled', 'Pending', 'History'];
  RxList<bool> expandedData = <bool>[].obs;
  final List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
  }

  Future<void> getBookedList() async {
    isLoading.value = true;
    final response = await bookedListRepository.execute(status: "", page: 1);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        bookings.value = data;
        final count = data.data?.data?.length ?? 0;
        expandedData.value = List.generate(count, (_) => false);
      },
    );
  }

  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    getBookedList();
    super.onInit();
  }
}
