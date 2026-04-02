import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/booking_model.dart';

class BookingManagementDetailsController extends GetxController {
  final Rxn<BookingItem> bookingItem = Rxn<BookingItem>();

  BookingItem? get booking => bookingItem.value;

  void setBooking(BookingItem item) {
    bookingItem.value = item;
  }

  @override
  void onInit() {
    super.onInit();
    // Get the booking item passed via arguments
    final args = Get.arguments;
    if (args != null && args is BookingItem) {
      bookingItem.value = args;
    }
  }
}
