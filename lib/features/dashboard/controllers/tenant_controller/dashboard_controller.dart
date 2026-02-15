import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_metric_controller.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardController extends GetxController {
  final selectedDay = DateTime.now().obs;
  final scrollController = TrackingScrollController();
  RxBool isFavorite = false.obs;
  RxBool isAutoPay = false.obs;
  RxInt isDay = 0.obs;
  RxBool isUpgrade = false.obs;
  RxList<XFile> repairImages = <XFile>[].obs;
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
  List<Map<String, dynamic>> get userDashboardItems {
    return dashboardItem
        .where((user) => user['allowedUser'].contains(userIndex))
        .toList();
  }

  List<Map<String, dynamic>> get dashboardItem {
    final metricData =
        Get.find<DashboardMetricController>().dashboardMetric.value?.data;
    final totalRentPaid = metricData?.totalRentPaid ?? 0;
    final inspectionRequests = metricData?.inspectionRequests ?? 0;
    final applicationsSubmitted = metricData?.applicationsSubmitted ?? 0;
    final repairRequests = metricData?.repairRequests ?? 0;

    return [
      {
        "icon": IconsPath.dashboardRent,
        "title": 'Total Rent Paid',
        'allowedUser': [0, 1, 2],
        "value": '\$$totalRentPaid',
      },
      {
        "icon": IconsPath.dashboardBoking,
        "title": 'Total booking',
        'allowedUser': [3],
        "value": '1200',
      },
      {
        "icon": IconsPath.dashboardInspection,
        "title": 'Inspection Request',
        'allowedUser': [0, 1, 2, 3],
        "value": '$inspectionRequests',
      },
      {
        "icon": IconsPath.dashboardApplication,
        "title": 'Applications Submitted',
        'allowedUser': [0, 1, 2, 3],
        "value": '$applicationsSubmitted',
      },
      {
        "icon": IconsPath.dashboardRepair,
        "title": 'Repair Request',
        'allowedUser': [0, 1, 2, 3],
        "value": '$repairRequests',
      },
    ];
  }

  List<Map<String, dynamic>> drawerItems = [
    {
      'icon': IconsPath.dashboard,
      'title': 'Dashboard',
      'allowedUser': [0, 1, 2, 3],
      userIndex == 0 ? 'routes' : 'navIndex': userIndex == 0
          ? AppRoutes.mainHome
          : 0,
    },
    {
      'icon': IconsPath.drawerInspection,
      'title': 'Inspection Request',
      'allowedUser': [0],
      'routes': AppRoutes.inspectionRequestView,
    },
    {
      'icon': IconsPath.drawerService,
      'title': 'Service Management',
      'allowedUser': [3],
      'routes': AppRoutes.serviceManagementView,
    },
    {
      'icon': IconsPath.drawerBook,
      'title': 'Booking Management',
      'allowedUser': [3],
      'navIndex': 1,
    },
    {
      'icon': IconsPath.dashboardPropertyManagement,
      'title': 'Property Management',
      'allowedUser': [1, 2],
      'routes': AppRoutes.propertyManagement,
    },
    {
      'icon': IconsPath.dashboardInspectionManagement,
      'title': 'Inspection Management',
      'allowedUser': [1, 2],
      'routes': AppRoutes.inspectionRequestView,
    },
    {
      'icon': IconsPath.application,
      'title': 'Application Management',
      'allowedUser': [1],
      'routes': AppRoutes.applicationManagementView,
    },
    {
      'icon': IconsPath.drawerKey,
      'title': 'Key Release',
      'allowedUser': [0, 2],
      'routes': AppRoutes.keyReleaseView,
    },
    {
      'icon': IconsPath.drawerKey,
      'title': 'Key Release',
      'allowedUser': [1],
      'routes': AppRoutes.landlordKeyRelease,
    },
    {
      'icon': IconsPath.drawerActive,
      'title': 'Active Properties',
      'allowedUser': [0],
      'routes': AppRoutes.activePropertiesView,
    },
    {
      'icon': IconsPath.drawerPayment,
      'title': 'Payment Management',
      'allowedUser': [0, 1, 3],
      'routes': AppRoutes.paymentManagementView,
    },
    {
      'icon': IconsPath.drawerPayment,
      'title': 'Rent Management',
      'allowedUser': [2],
      'routes': AppRoutes.paymentManagementView,
    },
    {
      'icon': IconsPath.drawerRepair,
      'title': 'Repair & Maintenance',
      'allowedUser': [0, 1, 2],
      'routes': AppRoutes.repairMaintenanceView,
    },
    {
      'icon': IconsPath.drawerService,
      'title': 'Service',
      'allowedUser': [0, 1, 2],
      'routes': AppRoutes.servicesView,
    },
    {
      'icon': IconsPath.dashboardCalender,
      'title': 'Calender',
      'allowedUser': [1, 2, 3],
      userIndex == 0 ? 'routes' : 'navIndex': userIndex == 0
          ? AppRoutes.landlordCalenderView
          : 3,
    },
  ];
  List<Map<String, dynamic>> get userDrawerItems {
    return drawerItems
        .where((user) => user['allowedUser'].contains(userIndex))
        .toList();
  }

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

  @override
  void onInit() {
    Get.find<GlobalScrollController>().listen(scrollController);
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }

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
