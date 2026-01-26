import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/repositories/get_properties_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeController extends GetxController {
  final GetPropertiesRepository getPropertiesRepository;
  HomeController({required this.getPropertiesRepository});
  final properties = Rxn<PropertiesModel>();
  final scrollController = ScrollController();
  final storage = Get.find<StorageService>();
  RxBool isLoading = true.obs;
  TextEditingController searchController = TextEditingController();
  RxInt selectedCategory = 0.obs;
  Rx<SfRangeValues> range = SfRangeValues(0, 700000).obs;
  double minRange = 0;
  double maxRange = 700000;
  TextEditingController filterSearchController = TextEditingController();
  RxList<String> selectedFilterProperty = <String>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  RxBool isShowPriceRange = true.obs;
  RxBool isShowAmenities = false.obs;
  RxBool isShowProperty = false.obs;
  RxBool isShowSearch = true.obs;
  Timer? _debounce;

  @override
  void onInit() {
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }
    getProperties();
    super.onInit();
  }

  void onSearchChanged({required String value}) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getProperties(search: value);
    });
  }

  Future<void> getProperties({String? search}) async {
    try {
      isLoading.value = true;
      String token = await storage.read(key: storage.tokenKey);
      final response = await getPropertiesRepository.execute(
        token: token,
        search: search,
        priceMin: range.value.start.toInt().toString(),
        priceMax: range.value.end.toInt().toString(),
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (success) {
          properties.value = success;
        },
      );
    } catch (e) {
      ErrorSnackbar.show(description: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<Property> get houseProperties => properties.value!.data!
      .where((element) => element.propertyType?.slug == "house")
      .toList();

  List<Property> get apartmentProperties => properties.value!.data!
      .where((element) => element.propertyType?.slug == "apartment")
      .toList();

  List<Property> get vilaProperties => properties.value!.data!
      .where((element) => element.propertyType?.slug == "villa")
      .toList();

  List<Property> get officeProperties => properties.value!.data!
      .where((element) => element.propertyType?.slug == "office")
      .toList();

  List<Property> get studioProperties => properties.value!.data!
      .where((element) => element.propertyType?.slug == "studio")
      .toList();

  @override
  void onClose() {
    _debounce?.cancel();
    scrollController.dispose();
    super.onClose();
  }
}
