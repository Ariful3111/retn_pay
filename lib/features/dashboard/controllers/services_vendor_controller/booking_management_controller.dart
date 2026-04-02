import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/booking_model.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/get_bookings_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class BookingManagementController extends GetxController {
  final GetBookingsRepository getBookingsRepository;
  BookingManagementController({required this.getBookingsRepository});
  final bookings = Rxn<BookingManagementModel>();
  RxBool isLoading = true.obs;
  List<String> bookingType = ['Booked', 'Pending', 'Rejected', 'Completed'];
  List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  List<String> exportType = ['CSV', 'PDF'];
  RxInt selectedExport = 0.obs;
  TextEditingController searchController = TextEditingController();
  RxInt bookingTypeIndex = 0.obs;
  RxList<bool> expanded = <bool>[].obs;

  // Get the list of booking items from API response
  List<BookingItem> get allBookings =>
      bookings.value?.data?.data ?? <BookingItem>[];

  // Filter bookings based on selected tab
  List<BookingItem> get filterRow {
    final allItems = allBookings;
    if (allItems.isEmpty) return [];

    switch (bookingTypeIndex.value) {
      case 0:
        return allItems
            .where((item) => item.status?.toLowerCase() == 'booked')
            .toList();
      case 1:
        return allItems
            .where((item) => item.status?.toLowerCase() == 'pending')
            .toList();
      case 2:
        return allItems
            .where((item) => item.status?.toLowerCase() == 'rejected')
            .toList();
      case 3:
        return allItems
            .where((item) => item.status?.toLowerCase() == 'completed')
            .toList();
      default:
        return allItems;
    }
  }

  void toggleExpanded(int index) {
    if (index >= 0 && index < expanded.length) {
      expanded[index] = !expanded[index];
    }
    expanded.refresh();
  }

  Future<void> getBookings() async {
    isLoading.value = true;
    final response = await getBookingsRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        bookings.value = data;
        // Initialize expanded list based on the number of bookings
        expanded.value = List.generate(
          data.data?.data?.length ?? 0,
          (_) => false,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getBookings();
  }
}
