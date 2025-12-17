import 'package:get/get.dart';

class BookedServiceModel {
  final String serviceName;
  final String serviceProviderContact;
  final String schedule;
  final String status;
  BookedServiceModel({
    required this.serviceName,
    required this.serviceProviderContact,
    required this.schedule,
    required this.status,
  });
}

class ServiceBookedController extends GetxController {
  RxInt isBookedType = 0.obs;
  final List bookedTypeList = ['Scheduled', 'Pending', 'History'];
  RxList<BookedServiceModel> bookedList = <BookedServiceModel>[].obs;
  RxList<bool> expandedData = <bool>[].obs;
  final List<String> tableColumn = ['Service Name', 'Status', 'Action'];

  List<MapEntry<int, BookedServiceModel>> get filterRow {
    final tempRow = <MapEntry<int, BookedServiceModel>>[];
    for (int i = 0; i < bookedList.length; i++) {
      tempRow.add(MapEntry(i, bookedList[i]));
    }
    List<MapEntry<int, BookedServiceModel>> tabFiltered;
    switch (isBookedType.value) {
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
            .where(
              (row) =>
                  row.value.status == 'Rejected' ||
                  row.value.status == 'Complete',
            )
            .toList();
        break;
      default:
        tabFiltered = tempRow;
    }
    return tabFiltered;
  }

  void initList() {
    bookedList.value = [
      BookedServiceModel(
        serviceName: 'AC Repair',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Pending',
      ),
      BookedServiceModel(
        serviceName: 'AC Repair',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Pending',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Pending',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Pending',
      ),
      BookedServiceModel(
        serviceName: 'Ac Repair',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Booked',
      ),
      BookedServiceModel(
        serviceName: 'Ac Repair',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Booked',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Booked',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Booked',
      ),
      BookedServiceModel(
        serviceName: 'Moving',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Rejected',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Rejected',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Rejected',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Complete',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Complete',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Complete',
      ),
      BookedServiceModel(
        serviceName: 'Plumbing',
        serviceProviderContact: '01753516345',
        schedule: '8 Aug, 2025 10:00 AM',
        status: 'Complete',
      ),
    ];
    expandedData.value = List.generate(bookedList.length, (_) => false);
    update();
  }

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
  }

  @override
  void onReady() {
    initList();
    super.onReady();
  }
}
