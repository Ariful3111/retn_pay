import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/rent/repositories/upload_document_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class UploadDocumentController extends GetxController {
  final UploadDocumentRepository uploadDocumentRepository;
  UploadDocumentController({required this.uploadDocumentRepository});
  ImagePicker picker = ImagePicker();
  Rxn<XFile> frontImage = Rxn<XFile>();
  Rxn<XFile> backImage = Rxn<XFile>();
  RxString selectedDocument = 'NID'.obs;
  RxBool isLoading = false.obs;

  Future<void> uploadDocument() async {
    if (frontImage.value == null) {
      ErrorSnackbar.show(description: "Please select front image");
    } else {
      isLoading.value = true;
      List<File> images = [];
      List<String> imageParameters = [];
      images.add(File(frontImage.value!.path));
      imageParameters.add("file");
      if (backImage.value != null) {
        images.add(File(backImage.value!.path));
        imageParameters.add("back_file");
      }
      final response = await uploadDocumentRepository.execute(
        imageParameters: imageParameters,
        images: images,
        documentType: selectedDocument.value.toLowerCase(),
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          SuccessSnackbar.show(description: "Document uploaded successfully");
          Get.back();
          Get.toNamed(AppRoutes.inspectionFrom);
        },
      );
    }
  }
}
