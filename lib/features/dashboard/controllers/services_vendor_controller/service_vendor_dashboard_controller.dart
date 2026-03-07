import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/own_services_model.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/own_service_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceVendorDashboardController extends GetxController {
  final OwnServicesRepository ownServicesRepository;
  ServiceVendorDashboardController({required this.ownServicesRepository});
  final ownServices = Rxn<OwnServicesModel>();
  RxBool isLoading = false.obs;
  RxList<bool> expandedData = <bool>[].obs;
  RxInt adIndex = (-1).obs;
  final selectedDay = DateTime.now().obs;
  RxInt isDay = 0.obs;
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  RxInt isItemSelect = 0.obs;

  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    getOwnServices();
    super.onInit();
  }

  final List<String> tableColumn = [
    'Service Name',
    'Property',
    'Status',
    'Action',
  ];
  final List<String> requestTableColumn = ['Service Name', 'Status', 'Action'];

  List<String> adList = ['\$7.99/week', '\$14.99/2 weeks', '\$29.99/month'];
  List<ServiceRequestItem> get requests =>
      ownServices.value?.data?.data ?? const <ServiceRequestItem>[];

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
    expandedData.refresh();
  }

  Future<void> getOwnServices() async {
    isLoading.value = true;
    final response = await ownServicesRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        ownServices.value = data;
        expandedData.assignAll(List.generate(requests.length, (_) => false));
      },
    );
  }
}
