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

  String get selectedMonthLabel {
    final df = DateFormat('MMMM, yyyy');

    if (rangeStart.value != null && rangeEnd.value != null) {
      final start = rangeStart.value!;
      final end = rangeEnd.value!;

      if (start.year == end.year && start.month == end.month) {
        return df.format(start);
      }

      return '${df.format(start)} - ${df.format(end)}';
    }

    return df.format(selectedDay.value);
  }

  List<CalenderEntry> get entries =>
      calenders.value?.data?.data ?? const <CalenderEntry>[];

  Map<DateTime, List<CalenderEntry>> get entriesByDay {
    final map = <DateTime, List<CalenderEntry>>{};
    for (final entry in entries) {
      final start = DateTime.tryParse(entry.startDatetime ?? '');
      if (start == null) continue;
      final local = start.isUtc ? start.toLocal() : start;
      final key = DateTime(local.year, local.month, local.day);
      (map[key] ??= <CalenderEntry>[]).add(entry);
    }
    return map;
  }

  void applyFilter() {
    final start = rangeStart.value != null
        ? DateTime(
            rangeStart.value!.year,
            rangeStart.value!.month,
            rangeStart.value!.day,
          )
        : DateTime(
            selectedDay.value.year,
            selectedDay.value.month,
            selectedDay.value.day,
          );
    final end = rangeEnd.value != null
        ? DateTime(
            rangeEnd.value!.year,
            rangeEnd.value!.month,
            rangeEnd.value!.day,
          )
        : start;

    getCalender(startDate: _formatApiDate(start), endDate: _formatApiDate(end));
  }

  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
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
    applyFilter();
  }

  void onDaySelected(DateTime day, DateTime focused) {
    selectedDay.value = day;
    focusedDay.value = focused;
    rangeStart.value = null;
    rangeEnd.value = null;
    applyFilter();
  }

  void onMonthChanged(DateTime focused) {
    focusedDay.value = focused;
    selectedDay.value = DateTime(
      focused.year,
      focused.month,
      selectedDay.value.day,
    );
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
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
