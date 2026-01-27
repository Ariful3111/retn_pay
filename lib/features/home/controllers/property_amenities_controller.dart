import 'package:get/get.dart';
import 'package:renter_pay/features/home/models/property_amenities_model.dart';
import 'package:renter_pay/features/home/repositories/property_amenities_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PropertyAmenitiesController extends GetxController {
  final PropertyAmenitiesRepository propertyAmenitiesRepository;
  PropertyAmenitiesController({required this.propertyAmenitiesRepository});

  final propertyAmenities = Rxn<PropertyAmenitiesModel>();
  RxBool isLoading = true.obs;
  RxList<String> filterSelectedNames = <String>[].obs;

  Future<void> getPropertyAmenities() async {
    final response = await propertyAmenitiesRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        propertyAmenities.value = data;
      },
    );
  }

  List<String> get filterAmenitiesNames =>
      propertyAmenities.value?.data
          ?.map((a) => a.name)
          .whereType<String>()
          .where((name) => name.trim().isNotEmpty)
          .toList() ??
      [];

  void onFilterAmenitiesChanged(List<String> names) {
    filterSelectedNames.assignAll(names);
  }

  String? getAmenitiesParam() {
    final amenities = propertyAmenities.value?.data;
    if (amenities != null && filterSelectedNames.isNotEmpty) {
      final slugs = amenities
          .where((a) => filterSelectedNames.contains(a.name))
          .map((a) => a.slug)
          .whereType<String>()
          .where((s) => s.isNotEmpty)
          .toList();
      if (slugs.isNotEmpty) {
        return slugs.join(',');
      }
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getPropertyAmenities();
  }
}
