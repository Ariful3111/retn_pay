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
  RxList<String> filterSelectedNames = <String>[].obs;

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

  List<String> get filterPropertyNames =>
      propertyCategories.value?.data
          ?.map((c) => c.name)
          .whereType<String>()
          .where((name) => name.trim().isNotEmpty)
          .toList() ??
      [];

  void onFilterPropertyChanged(List<String> names) {
    filterSelectedNames.assignAll(names);
  }

  String? getFilterTypeParam() {
    final categories = propertyCategories.value?.data;
    if (categories != null && filterSelectedNames.isNotEmpty) {
      final slugs = categories
          .where((c) => filterSelectedNames.contains(c.name))
          .map((c) => c.slug)
          .whereType<String>()
          .where((s) => s.isNotEmpty)
          .toList();
      if (slugs.isNotEmpty) {
        return slugs.join(',');
      }
    }
    return getSelectedSlug();
  }

  String? getSelectedSlug() {
    final categories = propertyCategories.value?.data;
    final index = selectedCategory.value;
    if (categories == null || index < 0 || index >= categories.length) {
      return null;
    }
    return categories[index].slug;
  }

  @override
  void onInit() {
    super.onInit();
    getPropertyCategories();
  }
}
