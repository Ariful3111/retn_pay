import 'package:get/get.dart';
import 'package:renter_pay/features/rent/models/property_review_model.dart';
import 'package:renter_pay/features/rent/repositories/property_review_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PropertyReviewController extends GetxController {
  final PropertyReviewRepository propertyReviewRepository;
  PropertyReviewController({required this.propertyReviewRepository});

  final propertyReviews = Rxn<PropertyReviewModel>();
  RxBool isLoading = true.obs;

  Future<void> getPropertyReviews({required String propertyID}) async {
    final response = await propertyReviewRepository.execute(
      propertyID: propertyID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        propertyReviews.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getPropertyReviews(propertyID: Get.arguments.toString());
  }
}
