import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_list_model.dart';
import 'package:renter_pay/features/dashboard/repositories/service_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ServiceManagementController extends GetxController {
  final ServiceListRepository serviceListRepository;
  ServiceManagementController({required this.serviceListRepository});

  final services = Rxn<ServiceListModel>();
  RxBool isLoading = true.obs;
  List<String> serviceType = ['Listed Service', 'Pending', 'Rejected'];
  List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  RxInt serviceTypeIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
  RxList<bool> expanded = <bool>[].obs;

  // Get all services from API response
  List<ServiceItem> get allServices =>
      services.value?.data?.data ?? <ServiceItem>[];

  // Filter services based on selected tab
  List<ServiceItem> get filterRow {
    final allItems = allServices;
    if (allItems.isEmpty) return [];

    switch (serviceTypeIndex.value) {
      case 0: // Listed Service = approved
        return allItems
            .where((item) => item.status?.toLowerCase() == 'approved')
            .toList();
      case 1: // Pending
        return allItems
            .where((item) => item.status?.toLowerCase() == 'pending')
            .toList();
      case 2: // Rejected
        return allItems
            .where((item) => item.status?.toLowerCase() == 'rejected')
            .toList();
      default:
        return allItems;
    }
  }

  void toggleExpanded(int index) {
    if (index >= 0 && index < expanded.length) {
      expanded[index] = !expanded[index];
    }
    expanded.refresh();
  }

  Future<void> getServices() async {
    isLoading.value = true;
    final response = await serviceListRepository.execute(
      status: 'active',
      page: 1,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        services.value = data;
        expanded.value = List.generate(
          data.data?.data?.length ?? 0,
          (_) => false,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getServices();
  }
}
