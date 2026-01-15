import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';

class BookingManagementController extends GetxController {
  List<String> bookingType = ['Booked', 'Pending', 'Rejected', 'Completed'];
  List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  List<String> exportType = ['CSV', 'PDF'];
  RxInt selectedExport = 0.obs;
  TextEditingController searchController = TextEditingController();
  RxInt bookingTypeIndex = 0.obs;
  RxList<bool> expanded = <bool>[].obs;
  RxList<ServiceManagementModel> allRows = <ServiceManagementModel>[].obs;
  List<MapEntry<int, ServiceManagementModel>> get filterRow {
    final tempRow = <MapEntry<int, ServiceManagementModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    List<MapEntry<int, ServiceManagementModel>> tabFiltered;
    switch (bookingTypeIndex.value) {
      case 0:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Booked')
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
      case 3:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Complete')
            .toList();
        break;
      default:
        tabFiltered = tempRow;
    }
    return tabFiltered;
  }

  void initRows() {
    allRows.value = [
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Booked', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Booked', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Booked', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Booked', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Booked', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Rejected', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      ServiceManagementModel(serviceName: 'Plumbing', status: 'Complete', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
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
