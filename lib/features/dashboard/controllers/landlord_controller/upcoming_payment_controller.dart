import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/upcoming_payments_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/upcoming_payment_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class UpcomingPaymentController extends GetxController {
  final UpcomingPaymentRepository upcomingPaymentRepository;
  UpcomingPaymentController({required this.upcomingPaymentRepository});

  final upcomingPayments = Rxn<UpcomingPaymentsModel>();
  RxBool isLoading = true.obs;

  Future<void> getUpcomingPayment() async {
    isLoading.value = true;
    final response = await upcomingPaymentRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        upcomingPayments.value = data;
        debugPrint("Upcoming Payment API Called");
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getUpcomingPayment();
  }
}
