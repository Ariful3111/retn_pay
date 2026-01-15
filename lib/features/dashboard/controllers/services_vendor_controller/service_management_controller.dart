import 'package:get/get.dart';

class ServiceManagementModel {
  final String serviceName;
  final String status;
  final String clientName;
  final String address;
  final String schedule;
  ServiceManagementModel({required this.serviceName, required this.status, required this.clientName, required this.address, required this.schedule});
}

class ServiceManagementController extends GetxController {
  List<String> serviceType = ['Listed Service', 'Pending', 'Rejected'];
  List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  RxInt serviceTypeIndex = 0.obs;
  RxList<bool> expanded = <bool>[].obs;
  RxList<ServiceManagementModel> allRows = <ServiceManagementModel>[].obs;
  List<MapEntry<int, ServiceManagementModel>> get filterRow {
    final tempRow = <MapEntry<int, ServiceManagementModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    List<MapEntry<int, ServiceManagementModel>> tabFiltered;
    switch (serviceTypeIndex.value) {
      case 0:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Approved')
            .toList();
        break;
      case 1:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Pending')
            .toList();
        break;
      case 2:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Rejected')
            .toList();
        break;
      default:
        tabFiltered = tempRow;
    }
    return tabFiltered;
  }

  void initRows() {
    allRows.value = [
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Approved', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Approved', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Approved', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Approved', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Approved', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
    ];
    expanded.value = List.generate(allRows.length, (_) => false);
    update();
  }

  void toggleExpanded(int index) {
    if (index >= 0 && index < expanded.length) {
      expanded[index] = !expanded[index];
    }
    expanded.refresh();
  }

  @override
  void onReady() {
    initRows();
    super.onReady();
  }
}
