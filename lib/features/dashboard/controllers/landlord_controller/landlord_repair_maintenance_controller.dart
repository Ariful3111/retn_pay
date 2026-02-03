import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MaintenanceModel {
  final String tenantName;
  final String address;
  final String issueName;
  final String urgency;
  final String status;
  MaintenanceModel({
    required this.tenantName,
    required this.address,
    required this.issueName,
    required this.urgency,
    required this.status,
  });
}

class LandlordRepairMaintenanceController extends GetxController {
  RxInt repairTypeIndex = 0.obs;
  List<String> repairType = ['Active Requests', 'Complete'];
  RxList<MaintenanceModel> dataList = <MaintenanceModel>[].obs;
  final List<String> repairColumn = ['Issue Name', 'Status', 'Action'];
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  RxList<bool> expandedData = <bool>[].obs;
  RxList<XFile> imageList = <XFile>[].obs;
  List<MapEntry<int, MaintenanceModel>> get tableData {
    final tempData = <MapEntry<int, MaintenanceModel>>[];
    for (int i = 0; i < dataList.length; i++) {
      tempData.add(MapEntry(i, dataList[i]));
    }
    List<MapEntry<int, MaintenanceModel>> filterData;
    switch (repairTypeIndex.value) {
      case 0:
        filterData = tempData
            .where(
              (data) =>
                  data.value.status == 'Pending' ||
                  data.value.status == 'Assigned',
            )
            .toList();
        break;
      case 1:
        filterData = tempData
            .where((data) => data.value.status == 'Completed')
            .toList();
        break;
      default:
        filterData = tempData;
    }
    return filterData;
  }

  void initRows() {
    dataList.value = [
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Urgent',
        status: 'Assigned',
      ),
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Urgent',
        status: 'Assigned',
      ),
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Urgent',
        status: 'Pending',
      ),
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Non - Urgent',
        status: 'Pending',
      ),
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Non - Urgent',
        status: 'Completed',
      ),
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Non - Urgent',
        status: 'Completed',
      ),
      MaintenanceModel(
        tenantName: 'Ariful',
        address: '987 Birch Boulevard',
        issueName: 'Leaking Faucet',
        urgency: 'Non - Urgent',
        status: 'Completed',
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
