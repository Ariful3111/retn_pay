import 'package:get/get.dart';

class RepairModel {
  final String title;
  final String type;
  final String date;
  final String status;

  RepairModel({
    required this.title,
    required this.type,
    required this.date,
    required this.status,
  });
}

class RepairMaintenanceController extends GetxController {
  RxInt repairTypeIndex = 0.obs;
  final List<String> repairType = ['Active', 'Complete'];
  final List<String> repairColumn = ['Issue ', 'Status', 'Action'];
  RxList<RepairModel> dataList = <RepairModel>[].obs;
  RxList<bool> expandedData = <bool>[].obs;

  List<MapEntry<int, RepairModel>> get tableData {
    final tempData = <MapEntry<int, RepairModel>>[];
    for (int i = 0; i < dataList.length; i++) {
      tempData.add(MapEntry(i, dataList[i]));
    }
    List<MapEntry<int, RepairModel>> filterData;
    switch (repairTypeIndex.value) {
      case 0:
        filterData = tempData
            .where(
              (data) =>
                  data.value.status == 'Pending' ||
                  data.value.status == 'Assigned' ||
                  data.value.status == 'In Progress',
            )
            .toList();
        break;
      case 1:
        filterData = tempData
            .where((data) => data.value.status == 'Complete')
            .toList();
        break;
      default:
        filterData = tempData;
    }
    return filterData;
  }

  void initRows() {
    dataList.value = [
      RepairModel(
        title: 'Leaking Kitchen Sink',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'Pending',
      ),
      RepairModel(
        title: 'AC Not Cooling Properly',
        type: 'Non - Urgent',
        date: '2 July, 2025',
        status: 'Assigned',
      ),
      RepairModel(
        title: 'AC Not Cooling Properly',
        type: 'Non - Urgent',
        date: '2 July, 2025',
        status: 'Assigned',
      ),
      RepairModel(
        title: 'AC Not Cooling Properly',
        type: 'Non - Urgent',
        date: '2 July, 2025',
        status: 'Assigned',
      ),
      RepairModel(
        title: 'Leaking Kitchen Sink',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'In Progress',
      ),
      RepairModel(
        title: 'Leaking Kitchen Sink',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'In Progress',
      ),
      RepairModel(
        title: 'Leaking Kitchen Sink',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'In Progress',
      ),
      RepairModel(
        title: 'Bathroom Tap Replacement',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'Complete',
      ),
      RepairModel(
        title: 'Bathroom Tap Replacement',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'Complete',
      ),
      RepairModel(
        title: 'Bathroom Tap Replacement',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'Complete',
      ),
      RepairModel(
        title: 'Leaking Kitchen Sink',
        type: 'Urgent',
        date: '2 July, 2025',
        status: 'Pending',
      ),
    ];
    expandedData.value = List.generate(dataList.length, (_) => false);
    update();
  }

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
  }

  @override
  void onReady() {
    initRows();
    super.onReady();
  }
}
