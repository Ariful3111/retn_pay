import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/models/property_category_model.dart';
import 'package:renter_pay/features/home/repositories/property_category_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PropertyCategoryController extends GetxController {
  final PropertyCategoryRepository propertyCategoryRepository;
  PropertyCategoryController({required this.propertyCategoryRepository});

  final propertyCategories = Rxn<PropertyCategoryModel>();
  RxBool isLoading = true.obs;
  RxInt selectedCategory = (-1).obs;

  Future<void> getPropertyCategories() async {
    final response = await propertyCategoryRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
        debugPrint(error.message);
      },
      (data) {
        propertyCategories.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getPropertyCategories();
  }
}
