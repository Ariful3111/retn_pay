import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/get_inspections_repo.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_landlord_quick_action_model.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';

class DashboardLandlordQuickAction extends GetWidget<DashboardController> {
  const DashboardLandlordQuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordCalender,
          title: 'Calendar Access',
          subTitle: 'Stay on top of rent due dates, inspections, and events.',
          onTap: () {
            Get.find<MainHomeController>().selectIndex.value = 3;
          },
          buttonText: 'Open Calendar',
        ),
        if (userIndex == 1)
          DashboardLandlordQuickActionModel(
            icon: IconsPath.dashboardAddProperty,
            title: 'Add New Properties',
            subTitle: 'Expand your portfolio by adding a new rental property.',
            onTap: () {
              // Pre-initialize controller if not already registered
              if (!Get.isRegistered<AddNewPropertyController>()) {
                Get.put(
                  AddNewPropertyController(
                    createPropertyRepository: Get.find(),
                  ),
                );
              }
              Get.toNamed(AppRoutes.addNewProperty);
              controller.isItemSelect.value = 1;
            },
            buttonText: 'Add Property',
          ),
        if (userIndex == 2)
          DashboardLandlordQuickActionModel(
            icon: IconsPath.dashboardLandlordTask,
            title: 'Task Management',
            subTitle:
                'Organize, track, and complete your tasks efficiently in one place.',
            onTap: () {},
            buttonText: 'View Task',
          ),
        if (userIndex == 3)
          DashboardLandlordQuickActionModel(
            icon: IconsPath.dashboardService,
            title: 'Service Management',
            subTitle:
                'Organize, track, and complete your services efficiently in one place.',
            onTap: () {},
            buttonText: 'View Service',
          ),
        if (userIndex != 3)
          DashboardLandlordQuickActionModel(
            icon: IconsPath.dashboardLandlordInspection,
            title: 'Scheduled Inspections',
            subTitle: 'View upcoming property inspections with ease.',
            onTap: () {
              Get.toNamed(AppRoutes.inspectionRequestView);
              Get.find<DashboardController>().isItemSelect.value = 2;
            },
            buttonText: 'View Schedule ',
          ),
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordVirtual,
          title: 'Virtual Tour Request',
          subTitle: 'Quickly view the request for virtual tour',
          onTap: navigator,
          buttonText: 'View Request',
        ),
      ],
    );
  }

  void navigator() {
    //  Get.toNamed(AppRoutes.vrCaptureScreen);
    Get.toNamed(AppRoutes.inspectionRequestView);
    controller.isItemSelect.value = 2;

    if (!Get.isRegistered<GetInspectionsRepository>()) {
      Get.lazyPut(() => GetInspectionsRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<InspectionRequestController>()) {
      Get.lazyPut(
        () => InspectionRequestController(getInspectionsRepository: Get.find()),
      );
    }
    InspectionRequestController inspectionRequestController = Get.find();
    inspectionRequestController.isInspectionType.value = 1;
    inspectionRequestController.getInspectionStatus(
      status: inspectionRequestController.isInspectionType.value,
    );
  }
}
