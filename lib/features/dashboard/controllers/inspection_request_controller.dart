import 'package:get/get.dart';

class InspectionModel { 
  final String address;
  final String rent;
  final String scheduleDate;
  final String type;
  final String status;

  InspectionModel({
    required this.address,
    required this.rent,
    required this.scheduleDate,
    required this.type,
    required this.status,
  });
}

class InspectionRequestController extends GetxController{
  RxInt isInspectionType = 0.obs;
  RxBool isFilter = false.obs;
  RxInt filterIndex = 0.obs;
  RxList<bool> expanded = <bool>[].obs;
  final List inspectionTypeList = ['Scheduled', 'Pending', 'History'];
  final List filterList = ['All', 'Approved', 'Complete'];
  final List<String> tableColumn = ['Property Address', 'Status', 'Action'];
  RxList<InspectionModel> allRows = <InspectionModel>[].obs;

  List<MapEntry<int, InspectionModel>> get filterRow {
    final tempRow = <MapEntry<int, InspectionModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    List<MapEntry<int, InspectionModel>> tabFiltered;
    switch (isInspectionType.value) {
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
    if (filterIndex.value == 1) {
      tabFiltered = tabFiltered
          .where((row) => row.value.status == 'Approved')
          .toList();
    } else if (filterIndex.value == 2) {
      tabFiltered = tabFiltered
          .where((row) => row.value.status == 'Complete')
          .toList();
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
      ),
      InspectionModel(
        address: "456 Oak Avenue",
        rent: "\$540/week",
        scheduleDate: "1 Aug, 2025 11:00 AM",
        type: "In-Person",
        status: "Complete",
      ),
      InspectionModel(
        address: "789 Pine Crescent",
        rent: "\$390/week",
        scheduleDate: "10 Aug, 2025 9:00 AM",
        type: "VR",
        status: "Pending",
      ),
      InspectionModel(
        address: "321 Maple Road",
        rent: "\$620/week",
        scheduleDate: "12 Aug, 2025 02:00 PM",
        type: "In-Person",
        status: "Rejected",
      ),
      InspectionModel(
        address: "654 Birch Street",
        rent: "\$500/week",
        scheduleDate: "20 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Complete",
      ),
      InspectionModel(
        address: "501 Cedar Lane",
        rent: "\$480/week",
        scheduleDate: "30 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Cancel",
      ),
      InspectionModel(
        address: "123 Elm Street",
        rent: "\$450/week",
        scheduleDate: "8 Aug, 2025 10:00 AM",
        type: "In-Person",
        status: "Approved",
      ),
      InspectionModel(
        address: "456 Oak Avenue",
        rent: "\$540/week",
        scheduleDate: "1 Aug, 2025 11:00 AM",
        type: "VR",
        status: "Complete",
      ),
      InspectionModel(
        address: "789 Pine Crescent",
        rent: "\$390/week",
        scheduleDate: "10 Aug, 2025 9:00 AM",
        type: "VR",
        status: "Pending",
      ),
      InspectionModel(
        address: "321 Maple Road",
        rent: "\$620/week",
        scheduleDate: "12 Aug, 2025 02:00 PM",
        type: "VR",
        status: "Rejected",
      ),
      InspectionModel(
        address: "654 Birch Street",
        rent: "\$500/week",
        scheduleDate: "20 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Complete",
      ),
      InspectionModel(
        address: "654 Birch Street",
        rent: "\$500/week",
        scheduleDate: "20 Jul, 2025 01:00 PM",
        type: "VR",
        status: "Complete",
      ),
      InspectionModel(
        address: "501 Cedar Lane",
        rent: "\$480/week",
        scheduleDate: "30 Jul, 2025 01:00 PM",
        type: "In-Person",
        status: "Approved",
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
    );
    allRows.refresh();
  }

  @override
  void onReady() {
    initRows();
    super.onReady();
  }

}
