import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

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
  final selectedDay = DateTime.now().obs;
  RxInt isDay = 0.obs;
  RxInt isBookedType = 0.obs;
  final List bookedTypeList = ['Scheduled', 'Pending', 'History'];
  RxList<BookedServiceModel> bookedList = <BookedServiceModel>[].obs;
  RxList<bool> expandedData = <bool>[].obs;
  final List<String> tableColumn = ['Service Name', 'Status', 'Action'];
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

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
  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    super.onInit();
  }
}
