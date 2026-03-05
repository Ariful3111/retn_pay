import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/applications_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/get_applications_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ApplicationManagementController extends GetxController {
  final GetApplicationsRepository getApplicationsRepository;
  ApplicationManagementController({required this.getApplicationsRepository});
  final applications = Rxn<ApplicationsModel>();
  RxBool isLoading = true.obs;
  RxList<int> expanded = <int>[].obs;
  final List<String> tableColumn = [
    'Property Address',
    'Status',
    'View Application',
  ];

  List<ApplicationItem> get items => applications.value?.data?.data ?? const [];

  Future<void> getApplications() async {
    isLoading.value = true;
    final response = await getApplicationsRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        applications.value = data;
      },
    );
  }

  void toggleExpanded({required int id}) {
    if (expanded.contains(id)) {
      expanded.remove(id);
    } else {
      expanded.add(id);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getApplications();
  }
}
