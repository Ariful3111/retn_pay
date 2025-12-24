import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RentController extends GetxController {
  final scrollController = ScrollController();
  Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  double minRange = 0;
  double maxRange = 700000;
  RxString initialSort = 'sortBy'.obs;
  List sortList = ['Low To High','High to Low'];
  TextEditingController filterSearchController = TextEditingController();
  RxList<String> selectedFilterProperty = <String>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  RxList apartmentRating = List<double>.filled(12, 1.0).obs;
  RxList houseRating = List<double>.filled(12, 1.0).obs;
  RxList officeRating = List<double>.filled(12, 1.0).obs;
  RxList studioRating = List<double>.filled(12, 1.0).obs;
  RxList vilaRating = List<double>.filled(12, 1.0).obs;
  RxBool isShowPriceRange = true.obs;
  RxBool isShowAmenities = false.obs;
  RxBool isShowProperty = false.obs;
  RxBool isShowSearch = true.obs;
  var currentPage = 1.obs;
  int totalPage = 100;
  List dialogImageList = [
    ImagesPath.house,
    ImagesPath.apartment,
    ImagesPath.office,
    ImagesPath.studio,
    ImagesPath.vila,
  ];
  RxInt dialogImageIndex = 0.obs;
  void dialogSelectedIndex(int index) {
    dialogImageIndex.value = index;
  }

  void previousPage() {
    if (currentPage > 1) currentPage.value--;
  }

  void nextPage() {
    if (currentPage < totalPage) currentPage++;
  }

  List<dynamic> get pageNumber {
    int page = currentPage.value;

    if (totalPage <= 6) {
      return List.generate(totalPage, (i) => i + 1);
    }

    if (page <= 3) {
      return [1, 2, '...', totalPage - 1, totalPage];
    }

    if (page >= totalPage - 2) {
      return [1, 2, '...', totalPage - 1, totalPage];
    }

    return [1, '...', page - 1, page, page + 1, '...', totalPage];
  }

  @override
  void onInit() {
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
