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
  RxString initialSort = 'sortBy'.obs;
  RxString currentSort = ''.obs; // Store current API sort value
  List<String> sortList = ['Low To High', 'High to Low'];
  RxInt currentPage = 1.obs;
  int totalPage = 1;

  Future<void> getRentList({required int page, String? rentSort}) async {
    // Store sort value for pagination
    if (rentSort != null) currentSort.value = rentSort;

    isLoading.value = true;
    final response = await getRentListRepository.execute(
      page: page,
      rentSort: rentSort ?? currentSort.value,
    );
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

  RxInt detailImageIndex = 0.obs;
  void detailSelectedIndex(int index) {
    detailImageIndex.value = index;
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getRentList(page: currentPage.value);
    }
  }

  void nextPage() {
    if (currentPage.value < totalPage) {
      currentPage.value++;
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
