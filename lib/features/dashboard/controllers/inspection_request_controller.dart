import 'package:get/get.dart';

class InspectionModel {
  String address;
  String status;

  InspectionModel({required this.address, required this.status});
}

class InspectionRequestController extends GetxController {
  RxInt isInspectionType = 0.obs;
  RxBool isFilter = false.obs;
  RxInt filterIndex = 0.obs;
  RxList<bool> expanded = <bool>[].obs;
  final List inspectionTypeList = ['Scheduled', 'Pending', 'History'];
  final List filterList = ['All', 'Approved', 'Complete'];
  final List tableColumn = ['Property Address', 'Status', 'Action'];
  RxList<InspectionModel> allRows = <InspectionModel>[].obs;

  // List<InspectionModel> get filterRow {
  //   List<InspectionModel> tempRow = [];
    
  // }

  void initRows(int count) {
    allRows.value = [
            InspectionModel(address: '123 Elm Street', status: 'Approved'),
      InspectionModel(address: '456 Oak Avenue', status: 'Complete'),
      InspectionModel(address: '789 Pine Crescent', status: 'Pending'),
      InspectionModel(address: '321 Maple Road', status: 'Rejected'),
      InspectionModel(address: '654 Birch Street', status: 'Complete'),
      InspectionModel(address: '987 Cedar Lane', status: 'Approved'),
      InspectionModel(address: '123 Elm Street', status: 'Approved'),
      InspectionModel(address: '456 Oak Avenue', status: 'Complete'),
      InspectionModel(address: '789 Pine Crescent', status: 'Pending'),
      InspectionModel(address: '321 Maple Road', status: 'Rejected'),
      InspectionModel(address: '654 Birch Street', status: 'Complete'),
      InspectionModel(address: '987 Cedar Lane', status: 'Approved'),
    ];
    expanded.value = List.generate(allRows.length, (_) => false);
  }

  void toggleExpanded(int index) {
    expanded[index] = !expanded[index];
    expanded.refresh();
  }

  @override
  void onInit() {
    initRows();
    super.onInit();
  }
}
