import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/repair_maintenance_list_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/repair_maintenance_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class LandlordRepairMaintenanceController extends GetxController {
  final RepairMaintenanceListRepository repairMaintenanceListRepository;
  LandlordRepairMaintenanceController({
    required this.repairMaintenanceListRepository,
  });
  final repairs = <RepairMaintenanceListItem>[].obs;
  RxBool isLoading = true.obs;
  RxInt repairTypeIndex = 0.obs;
  List<String> repairType = ['Active Requests', 'Complete'];
  final List<String> repairColumn = ['Issue Name', 'Status', 'Action'];
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  RxList<bool> expandedData = <bool>[].obs;
  RxList<XFile> imageList = <XFile>[].obs;
  static const int perPage = 20;
  final currentPage = 1.obs;
  final lastPage = 1.obs;
  late final Worker _tabWorker;
  final scrollController = ScrollController();
  bool _isLoadingMore = false;

  String get _status =>
      repairTypeIndex.value == 1 ? 'completed' : 'in_progress';

  @override
  void onInit() {
    super.onInit();
    _tabWorker = ever<int>(repairTypeIndex, (_) {
      refreshList();
    });
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      if (scrollController.position.extentAfter > 300) return;
      loadMore();
    });
    refreshList();
  }

  Future<void> refreshList() async {
    currentPage.value = 1;
    lastPage.value = 1;
    repairs.clear();
    expandedData.clear();
    await _fetch(page: 1, append: false);
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || isLoading.value) return;
    if (currentPage.value >= lastPage.value) return;
    _isLoadingMore = true;
    await _fetch(page: currentPage.value + 1, append: true);
    _isLoadingMore = false;
  }

  Future<void> _fetch({required int page, required bool append}) async {
    isLoading.value = true;
    final response = await repairMaintenanceListRepository.execute(
      status: _status,
      page: page,
      perPage: perPage,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        final newItems = data.data?.data ?? <RepairMaintenanceListItem>[];
        currentPage.value = page;
        lastPage.value = data.data?.meta?.lastPage ?? 1;

        if (append) {
          repairs.addAll(newItems);
          expandedData.addAll(List<bool>.filled(newItems.length, false));
        } else {
          repairs.assignAll(newItems);
          expandedData.assignAll(List<bool>.filled(newItems.length, false));
        }
      },
    );
  }

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
    expandedData.refresh();
  }

  @override
  void onClose() {
    _tabWorker.dispose();
    scrollController.dispose();
    nameController.dispose();
    numberController.dispose();
    super.onClose();
  }
}
