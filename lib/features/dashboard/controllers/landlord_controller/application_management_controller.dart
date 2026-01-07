import 'package:get/get.dart';

class ApplicationModel {
  final String name;
  final String property;
  final String status;
  final String remark;
  ApplicationModel({
    required this.name,
    required this.property,
    required this.status,
    required this.remark,
  });
}

class ApplicationManagementController extends GetxController {
  RxList<bool> expanded = <bool>[].obs;
  final List<String> tableColumn = ['Property Address', 'Status', 'View Application'];
  RxList<ApplicationModel> allRows = <ApplicationModel>[].obs;
  List<MapEntry<int, ApplicationModel>> get filterRow {
    final tempRow = <MapEntry<int, ApplicationModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    return tempRow;
  }

  void initRows() {
    allRows.value = [
      ApplicationModel(
        property: "123 Elm Street",
        status: "Approved",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Approved",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Submitted",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Submitted",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Credit Check Approved",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Credit Check Approved",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Assessed Rental Threshold",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Assessed Rental Threshold",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Reference Checked",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Reference Checked",
        name: 'Ariful',
        remark: '-',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Rejected",
        name: 'Ariful',
        remark: 'Stronger Applicant was chosen/property unsuitable lor pets/Credit-bosed decision',
      ),
      ApplicationModel(
        property: "123 Elm Street",
        status: "Rejected",
        name: 'Ariful',
        remark: 'Stronger Applicant was chosen/property unsuitable lor pets/Credit-bosed decision',
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

  @override
  void onReady() {
    initRows();
    super.onReady();
  }
}
