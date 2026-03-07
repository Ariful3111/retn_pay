import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_list_model.dart';
import 'package:renter_pay/features/dashboard/repositories/service_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ServiceListController extends GetxController {
  final ServiceListRepository serviceListRepository;
  ServiceListController({required this.serviceListRepository});

  final services = Rxn<ServiceListModel>();
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  final items = <ServiceItem>[].obs;
  final scrollController = ScrollController();

  int _page = 1;
  int? _lastPage;

  Future<void> refreshList() async {
    isLoading.value = true;
    _page = 1;
    _lastPage = null;
    items.clear();
    await _fetchPage(page: _page, setLoadingMore: false);
    isLoading.value = false;
  }

  Future<void> loadNextPage() async {
    if (isLoading.value || isLoadingMore.value) return;
    if (_lastPage != null && _page >= _lastPage!) return;

    isLoadingMore.value = true;
    await _fetchPage(page: _page + 1, setLoadingMore: true);
    isLoadingMore.value = false;
  }

  Future<void> _fetchPage({
    required int page,
    required bool setLoadingMore,
  }) async {
    final response = await serviceListRepository.execute(
      status: 'active',
      page: page,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        services.value = data;
        final next = data.data?.data ?? const <ServiceItem>[];
        if (page == 1) {
          items.assignAll(next);
        } else if (next.isNotEmpty) {
          items.addAll(next);
        }

        final lastPage = data.data?.meta?.lastPage;
        if (lastPage != null) _lastPage = lastPage;
        _page = page;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      final position = scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 240) {
        loadNextPage();
      }
    });
    refreshList();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
