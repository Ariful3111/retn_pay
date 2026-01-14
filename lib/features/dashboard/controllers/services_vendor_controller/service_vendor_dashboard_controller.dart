import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class UpcomingServiceModel {
  final String name;
  final String area;
  final String status;
  final String clientName;
  final String address;
  final String schedule;
  UpcomingServiceModel({
    required this.name,
    required this.area,
    required this.status, required this.clientName, required this.address, required this.schedule,
  });
}

class ServiceVendorDashboardController extends GetxController {
  RxList<UpcomingServiceModel> upcomingList = <UpcomingServiceModel>[].obs;
  RxList<bool> expandedData = <bool>[].obs;
  RxInt adIndex = (-1).obs;
  final selectedDay = DateTime.now().obs;
  RxInt isDay = 0.obs;
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  RxInt isItemSelect = 0.obs;

  @override
  void onInit() {
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    super.onInit();
  }
  final List<String> tableColumn = [
    'Service Name',
    'Service Area',
    'Status',
    'Action',
  ];
  final List<String> requestTableColumn = [
    'Service Name',
    'Status',
    'Action',
  ];

  List<String> adList = ['\$7.99/week', '\$14.99/2 weeks', '\$29.99/month'];
  List<MapEntry<int, UpcomingServiceModel>> get filterRow {
    final tempRow = <MapEntry<int, UpcomingServiceModel>>[];
    for (int i = 0; i < upcomingList.length; i++) {
      tempRow.add(MapEntry(i, upcomingList[i]));
    }
    return tempRow;
  }

  void initList() {
    upcomingList.value = [
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
      UpcomingServiceModel(name: 'Plumbing', area: 'Dhaka', status: 'Pending', clientName: 'Arif', address: 'Dhaka', schedule: '8 Aug, 2025 10:00 AM'),
    ];
    expandedData.value = List.generate(upcomingList.length, (_) => false);
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
