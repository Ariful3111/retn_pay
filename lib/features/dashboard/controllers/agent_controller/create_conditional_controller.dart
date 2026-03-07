import 'dart:io';

import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/repositories/agent_repositories/create_conditional_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class CreateConditionalReportController extends GetxController {
  final CreateConditionalReportRepository createConditionalReportRepository;
  CreateConditionalReportController({
    required this.createConditionalReportRepository,
  });
  RxBool isLoading = false.obs;

  Future<void> createConditionalReport({
    required String propertyID,
    required String reportType,
    required String summary,
    required File image,
  }) async {
    if (propertyID.isEmpty) {
      ErrorSnackbar.show(description: "Please select a property");
      return;
    }
    if (image.path.isEmpty) {
      ErrorSnackbar.show(description: "Please select an image");
      return;
    }

    isLoading.value = true;
    final response = await createConditionalReportRepository.execute(
      propertyID: propertyID,
      reportType: reportType,
      summary: summary,
      image: image,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        SuccessSnackbar.show(description: "Report Created");
        Get.back();
      },
    );
  }
}
