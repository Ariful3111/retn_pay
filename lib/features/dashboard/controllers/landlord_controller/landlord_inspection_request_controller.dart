import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';

class LandlordInspectionRequestController extends GetxController {
  List inspectionType = ['Pending', 'Schedule', 'History'];
  TextEditingController searchController = TextEditingController();
  RxInt isLandlordInsPectionType = 0.obs;
  final List<String> tableColumn = ['Property Address', 'Status', 'Action'];
  RxList<InspectionModel> allRows = <InspectionModel>[].obs;
  RxList<bool> expanded = <bool>[].obs;
  List<MapEntry<int, InspectionModel>> get filterRow {
    final tempRow = <MapEntry<int, InspectionModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    List<MapEntry<int, InspectionModel>> tabFiltered;
    switch (isLandlordInsPectionType.value) {
      case 0:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Pending')
            .toList();
        break;
      case 1:
        tabFiltered = tempRow
            .where((row) => row.value.status == 'Approved'||row.value.status=='Complete')
            .toList();
        break;
      case 2:
        tabFiltered = tempRow
            .where(
              (row) =>
                  row.value.status == 'Rejected' ||
                  row.value.status == 'Complete' ||
                  row.value.status == 'Cancel',
            )
            .toList();
        break;
      default:
        tabFiltered = tempRow;
    }
    return tabFiltered;
  }

  void initRows() {
    allRows.value = [
      InspectionModel(
        address: "123 Elm Street",
        rent: "\$450/week",
        scheduleDate: "8 Aug, 2025 10:00 AM",
        type: "VR",
        status: "Approved",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "456 Oak Avenue",
        rent: "\$540/week",
        scheduleDate: "1 Aug, 2025 11:00 AM",
        type: "In-Person",
        status: "Complete",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "789 Pine Crescent",
        rent: "\$390/week",
        scheduleDate: "10 Aug, 2025 9:00 AM",
        type: "VR",
        status: "Pending",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "321 Maple Road",
        rent: "\$620/week",
        scheduleDate: "12 Aug, 2025 02:00 PM",
        type: "In-Person",
        status: "Rejected",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "654 Birch Street",
        rent: "\$500/week",
        scheduleDate: "20 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Complete",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "501 Cedar Lane",
        rent: "\$480/week",
        scheduleDate: "30 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Cancel",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "123 Elm Street",
        rent: "\$450/week",
        scheduleDate: "8 Aug, 2025 10:00 AM",
        type: "In-Person",
        status: "Approved",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "456 Oak Avenue",
        rent: "\$540/week",
        scheduleDate: "1 Aug, 2025 11:00 AM",
        type: "VR",
        status: "Complete",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "789 Pine Crescent",
        rent: "\$390/week",
        scheduleDate: "10 Aug, 2025 9:00 AM",
        type: "VR",
        status: "Pending",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "321 Maple Road",
        rent: "\$620/week",
        scheduleDate: "12 Aug, 2025 02:00 PM",
        type: "VR",
        status: "Rejected",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "654 Birch Street",
        rent: "\$500/week",
        scheduleDate: "20 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Complete",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "654 Birch Street",
        rent: "\$500/week",
        scheduleDate: "20 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Complete",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
      InspectionModel(
        address: "501 Cedar Lane",
        rent: "\$480/week",
        scheduleDate: "30 Jul, 2025 01:00 PM",
        type: "In-Person",
        status: "Approved",
        id: ImagesPath.profile,
        name: 'Ariful',
        email: 'arif@gmail.com',
        phone: '01566336323',
      ),
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

  void updateStatus(int index, String newStatus) {
    final old = allRows[index];
    allRows[index] = InspectionModel(
      address: old.address,
      rent: old.rent,
      scheduleDate: old.scheduleDate,
      type: old.type,
      status: newStatus,
      id: old.id,
      name: old.name,
      email: old.email,
      phone: old.phone,
    );
    allRows.refresh();
  }

  @override
  void onReady() {
    initRows();
    super.onReady();
  }
}
