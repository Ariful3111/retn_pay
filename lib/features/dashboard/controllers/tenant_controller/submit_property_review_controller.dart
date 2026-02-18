import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/submit_property_review_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class SubmitPropertyReviewController extends GetxController {
  final SubmitPropertyReviewRepository submitPropertyReviewRepository;
  SubmitPropertyReviewController({
    required this.submitPropertyReviewRepository,
  });

  final TextEditingController reviewController = TextEditingController();
  final RxDouble rating = 0.0.obs;
  RxBool isLoading = false.obs;

  Future<void> submitReview({required int propertyID}) async {
    isLoading.value = true;
    final response = await submitPropertyReviewRepository.execute(
      propertyID: propertyID,
      rating: rating.value,
      comment: reviewController.text,
      title: "Review",
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        SuccessSnackbar.show(description: "Review submitted successfully");
      },
    );
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}
