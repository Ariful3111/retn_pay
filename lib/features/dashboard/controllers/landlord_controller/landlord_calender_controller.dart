import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/calender_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/calender_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:table_calendar/table_calendar.dart';

class LandlordCalenderController extends GetxController {
  final CalenderRepository calenderRepository;
  LandlordCalenderController({required this.calenderRepository});
  final calenders = Rxn<CalenderModel>();
  final isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  RxInt isDay = 0.obs;
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final _monthLabelFormatter = DateFormat('MMMM, yyyy');
  final _apiDateFormatter = DateFormat('yyyy-MM-dd');

  String get selectedMonthLabel {
    if (rangeStart.value != null && rangeEnd.value != null) {
      final start = rangeStart.value!;
      final end = rangeEnd.value!;

      if (start.year == end.year && start.month == end.month) {
        return _monthLabelFormatter.format(start);
      }

      return '${_monthLabelFormatter.format(start)} - ${_monthLabelFormatter.format(end)}';
    }

    return _monthLabelFormatter.format(selectedDay.value);
  }

  List<CalenderEntry> get entries =>
      calenders.value?.data?.data ?? const <CalenderEntry>[];

  Map<DateTime, List<CalenderEntry>> get entriesByDay {
    final map = <DateTime, List<CalenderEntry>>{};
    for (final entry in entries) {
      final start = DateTime.tryParse(entry.startDatetime ?? '');
      if (start == null) continue;
      final local = start.isUtc ? start.toLocal() : start;
      final key = DateUtils.dateOnly(local);
      (map[key] ??= <CalenderEntry>[]).add(entry);
    }
    return map;
  }

  void applyFilter() {
    final start = DateUtils.dateOnly(rangeStart.value ?? selectedDay.value);
    final end = DateUtils.dateOnly(rangeEnd.value ?? start);
    getCalender(startDate: _formatApiDate(start), endDate: _formatApiDate(end));
  }

  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  @override
  void onInit() {
    final today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    super.onInit();
    applyFilter();
  }

  void onDaySelected(DateTime day, DateTime focused) {
    selectedDay.value = day;
    focusedDay.value = focused;
    rangeStart.value = null;
    rangeEnd.value = null;
    applyFilter();
  }

  Future<void> getCalender({
    required String startDate,
    required String endDate,
  }) async {
    isLoading.value = true;
    final response = await calenderRepository.execute(
      startDate: startDate,
      endDate: endDate,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        calenders.value = data;
      },
    );
    isLoading.value = false;
  }

  String _formatApiDate(DateTime date) {
    return _apiDateFormatter.format(date);
  }
}
