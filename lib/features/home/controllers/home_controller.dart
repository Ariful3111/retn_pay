import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
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
  RxList apartmentRating = List<double>.filled(10, 1.0).obs;
  RxList houseRating = List<double>.filled(10, 1.0).obs;
  RxList officeRating = List<double>.filled(10, 1.0).obs;
  RxList studioRating = List<double>.filled(10, 1.0).obs;
  RxList vilaRating = List<double>.filled(10, 1.0).obs;
  Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  double minRange = 0;
  double maxRange = 700000;
  TextEditingController filterSearchController = TextEditingController();
  final List<Map<String, dynamic>> categoryList = [
    {'category': 'All', 'image': ImagesPath.allCategory},
    {'category': 'House', 'image': ImagesPath.houseCategory},
    {'category': 'Apartment', 'image': ImagesPath.apartmentCategory},
    {'category': 'Vila', 'image': ImagesPath.vilaCategory},
    {'category': 'Office', 'image': ImagesPath.officeCategory},
    {'category': 'Studio Apartment', 'image': ImagesPath.studioCategory},
  ];
  RxList<String> selectedFilterProperty = <String>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  RxBool isShowPriceRange = true.obs;
  RxBool isShowAmenities = false.obs;
  RxBool isShowProperty = false.obs;
  RxBool isShowSearch = true.obs;
  @override
  void onInit() {
    apartmentRating;
    houseRating;
    studioRating;
    officeRating;
    vilaRating;
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }
    getProperties();
    super.onInit();
  }

  Future<void> getProperties() async {
    try {
      String token = await storage.read(key: storage.tokenKey);
      final response = await getPropertiesRepository.execute(token: token);
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

  List<Property> get recommendedProperties => properties.value!.data!
      .where((element) => element.type == "recommended")
      .toList();

  List<Property> get popularProperties => properties.value!.data!
      .where((element) => element.type == "popular")
      .toList();

  List<Property> get houseProperties => properties.value!.data!
      .where((element) => element.type == "house")
      .toList();

  List<Property> get apartmentProperties => properties.value!.data!
      .where((element) => element.type == "apartment")
      .toList();

  List<Property> get vilaProperties => properties.value!.data!
      .where((element) => element.type == "villa")
      .toList();

  List<Property> get officeProperties => properties.value!.data!
      .where((element) => element.type == "office")
      .toList();

  List<Property> get studioProperties => properties.value!.data!
      .where((element) => element.type == "studio")
      .toList();

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
