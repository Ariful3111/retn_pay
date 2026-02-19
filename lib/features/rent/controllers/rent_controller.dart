import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/rent/models/rent_list_model.dart';
import 'package:renter_pay/features/rent/repositories/rent_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class RentController extends GetxController {
  final GetRentListRepository getRentListRepository;
  RentController({required this.getRentListRepository});
  final rents = Rxn<RentListModel>();
  final scrollController = ScrollController();
  RxBool isLoading = true.obs;
  // Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  // double minRange = 0;
  // double maxRange = 700000;
  RxString initialSort = 'sortBy'.obs;
  List<String> sortList = ['Low To High', 'High to Low'];
  // TextEditingController filterSearchController = TextEditingController();
  // RxList<String> selectedFilterProperty = <String>[].obs;
  // RxList<String> selectedAmenities = <String>[].obs;
  // RxList apartmentRating = List<double>.filled(12, 1.0).obs;
  // RxList houseRating = List<double>.filled(12, 1.0).obs;
  // RxList officeRating = List<double>.filled(12, 1.0).obs;
  // RxList studioRating = List<double>.filled(12, 1.0).obs;
  // RxList vilaRating = List<double>.filled(12, 1.0).obs;
  // RxBool isShowPriceRange = true.obs;
  // RxBool isShowAmenities = false.obs;
  // RxBool isShowProperty = false.obs;
  // RxBool isShowSearch = true.obs;
  RxInt currentPage = 1.obs;
  int totalPage = 1;

  Future<void> getRentList({required int page}) async {
    final response = await getRentListRepository.execute(page: page);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        rents.value = data;
        totalPage = data.data?.meta?.lastPage ?? 1;
      },
    );
  }

  RxInt dialogImageIndex = 0.obs;
  void dialogSelectedIndex(int index) {
    dialogImageIndex.value = index;
  }

  void previousPage() {
    if (currentPage > 1) {
      currentPage.value--;
      getRentList(page: currentPage.value);
    }
  }

  void nextPage() {
    if (currentPage < totalPage) {
      currentPage++;
      getRentList(page: currentPage.value);
    }
  }

  List<dynamic> get pageNumber {
    int page = currentPage.value;

    if (totalPage <= 6) {
      return List.generate(totalPage, (i) => i + 1);
    }

    if (page <= 3) {
      return [1, 2, 3, '...', totalPage - 1, totalPage];
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

    getRentList(page: currentPage.value);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
