import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_landlord_quick_action_model.dart';

class DashboardLandlordQuickAction extends StatelessWidget {
  const DashboardLandlordQuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordCalender,
          title: 'Calendar Access',
          subTitle: 'Stay on top of rent due dates, inspections, and events.',
          onTap: () {},
          buttonText: 'Open Calendar',
        ),
        if (userIndex == 1)
          DashboardLandlordQuickActionModel(
            icon: IconsPath.dashboardAddProperty,
            title: 'Add New Properties',
            subTitle: 'Expand your portfolio by adding a new rental property.',
            onTap: () {},
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
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordInspection,
          title: 'Scheduled Inspections',
          subTitle: 'View upcoming property inspections with ease.',
          onTap: () {},
          buttonText: 'View Schedule ',
        ),
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordVirtual,
          title: 'Virtual Tour Request',
          subTitle: 'Quickly view the request for virtual tour',
          onTap: () {
            Get.toNamed(AppRoutes.vrCaptureScreen);
          },
          buttonText: 'View Request',
        ),
      ],
    );
  }
}
