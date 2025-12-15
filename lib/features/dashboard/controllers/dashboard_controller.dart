import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardController extends GetxController {
  final scrollController = ScrollController();
  RxBool isFavorite = false.obs;
  RxBool isAutoPay = false.obs;
  RxInt isDay = 0.obs;
  RxList<String> repairImages = <String>[].obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isQuickActions = false.obs;
  List dialogImageList = [
    ImagesPath.house,
    ImagesPath.apartment,
    ImagesPath.office,
    ImagesPath.studio,
    ImagesPath.vila,
  ];
  RxInt dialogImageIndex = 0.obs;
  List drawerItems = [
    {'icon': IconsPath.dashboard, 'title': 'Dashboard'},
    {'icon': IconsPath.drawerInspection, 'title': 'Inspection Request'},
    {'icon': IconsPath.drawerKey, 'title': 'Key Release'},
    {'icon': IconsPath.drawerActive, 'title': 'Active Properties'},
    {'icon': IconsPath.drawerPayment, 'title': 'Payment Management'},
    {'icon': IconsPath.drawerRepair, 'title': 'Repair & Maintenance'},
    {'icon': IconsPath.drawerService, 'title': 'Service'},
  ];
  List dashboardItems = [
    {'icon': IconsPath.dashboardRent, 'title': 'Rents'},
    {'icon': IconsPath.dashboardInspection, 'title': 'Inspections'},
    {'icon': IconsPath.dashboardApplication, 'title': 'Applications'},
    {'icon': IconsPath.dashboardRepair, 'title': 'Repairs'},
  ];
  RxList<Map<String, dynamic>> reminderList = [
    {
      'title': 'Inspection Reminder',
      'detail':
          'Your lease for Harborview Apartments\nexpires soon — renew online to avoid\ninterruption.',
      'date': '12 Aug, 2023 at 10:00 AM',
    },
    {
      'title': 'Rent Due Reminder',
      'detail':
          'Your rent for Maplewood Apartments\nis due in 3 days. Please ensure payment\nis made on time.',
      'date': '15 Aug, 2023 at 09:00 AM',
    },
    {
      'title': 'Maintenance Reminder',
      'detail':
          'Scheduled maintenance for Pinecrest\nCondominiums is coming up next week.\nPlease prepare accordingly.',
      'date': '20 Aug, 2023 at 11:00 AM',
    },
    {
      'title': 'Inspection Reminder',
      'detail':
          'Your lease for Harborview Apartments\nexpires soon — renew online to avoid\ninterruption.',
      'date': '12 Aug, 2023 at 10:00 AM',
    },
    {
      'title': 'Rent Due Reminder',
      'detail':
          'Your rent for Maplewood Apartments\nis due in 3 days. Please ensure payment\nis made on time.',
      'date': '15 Aug, 2023 at 09:00 AM',
    },
    {
      'title': 'Maintenance Reminder',
      'detail':
          'Scheduled maintenance for Pinecrest\nCondominiums is coming up next week.\nPlease prepare accordingly.',
      'date': '20 Aug, 2023 at 11:00 AM',
    },
  ].obs;
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  RxInt isItemSelect = 0.obs;
  void dialogSelectedIndex(int index) {
    dialogImageIndex.value = index;
  }

  List drawerPage = [
    AppRoutes.mainHome,
    AppRoutes.inspectionRequestView,
    AppRoutes.keyReleaseView,
    AppRoutes.activePropertiesView,
    AppRoutes.paymentManagementView,
    AppRoutes.repairMaintenanceView,
    AppRoutes.servicesView,
  ];
  @override
  void onInit() {
    Get.find<GlobalScrollController>().listen(scrollController);
    today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
