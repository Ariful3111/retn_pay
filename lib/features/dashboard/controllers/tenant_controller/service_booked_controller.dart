import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';
import 'package:renter_pay/features/dashboard/repositories/booked_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceBookedController extends GetxController {
  final BookedListRepository bookedListRepository;
  ServiceBookedController({required this.bookedListRepository});
  final bookings = Rxn<BookingListModel>();
  final items = <BookingItem>[].obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  final selectedDay = DateTime.now().obs;
  RxInt isDay = 0.obs;
  RxInt isBookedType = 0.obs;
  final List bookedTypeList = ['Scheduled', 'Pending', 'History'];
  RxList<bool> expandedData = <bool>[].obs;
  final List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  final scrollController = ScrollController();
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

  String _date = '';
  String _dateFrom = '';
  String _dateTo = '';
  int _page = 1;
  int? _lastPage;

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
  }

  String _ymd(DateTime date) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${date.year}-${two(date.month)}-${two(date.day)}';
  }

  String _statusParam() {
    switch (isBookedType.value) {
      case 0:
        return 'in_progress';
      case 1:
        return 'pending';
      case 2:
      default:
        return '';
    }
  }

  void applyDateFilter() {
    final start = rangeStart.value;
    final end = rangeEnd.value;

    if (start != null && end != null) {
      _date = '';
      _dateFrom = _ymd(start);
      _dateTo = _ymd(end);
    } else {
      _dateFrom = '';
      _dateTo = '';
      _date = _ymd(selectedDay.value);
    }
    refreshList();
  }

  Future<void> refreshList() async {
    isLoading.value = true;
    _page = 1;
    _lastPage = null;
    items.clear();
    expandedData.clear();
    await _fetchPage(page: 1, setLoadingMore: false);
    isLoading.value = false;
  }

  Future<void> loadNextPage() async {
    if (isLoading.value || isLoadingMore.value) return;
    if (_lastPage != null && _page >= _lastPage!) return;

    isLoadingMore.value = true;
    await _fetchPage(page: _page + 1, setLoadingMore: true);
    isLoadingMore.value = false;
  }

  Future<void> _fetchPage({
    required int page,
    required bool setLoadingMore,
  }) async {
    final response = await bookedListRepository.execute(
      status: _statusParam(),
      page: page,
      dateFrom: _dateFrom,
      dateTo: _dateTo,
      date: _date,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        bookings.value = data;
        final next = data.data?.data ?? const <BookingItem>[];
        if (page == 1) {
          items.assignAll(next);
          expandedData.assignAll(List.generate(next.length, (_) => false));
        } else if (next.isNotEmpty) {
          items.addAll(next);
          expandedData.addAll(List.generate(next.length, (_) => false));
        }
        _lastPage = data.data?.meta?.lastPage;
        _page = page;
      },
    );
  }

  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      final position = scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 240) {
        loadNextPage();
      }
    });
    ever<int>(isBookedType, (_) => refreshList());
    refreshList();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
