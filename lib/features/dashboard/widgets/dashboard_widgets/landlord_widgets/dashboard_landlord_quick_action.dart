import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
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
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordTask,
          title: 'Task Management',
          subTitle: 'Organize, track, and complete your tasks efficiently in one place.',
          onTap: () {
            
          },
          buttonText: 'View Task',
        ),
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordInspection,
          title: 'Scheduled Inspections',
          subTitle: 'View upcoming property inspections with ease.',
          onTap: () {
            
          },
          buttonText: 'View Schedule ',
        ),
        DashboardLandlordQuickActionModel(
          icon: IconsPath.dashboardLandlordVirtual,
          title: 'Virtual Tour Request',
          subTitle: 'Quickly view the request for virtual tour',
          onTap: () {
            
          },
          buttonText: 'View Request',
        ),
      ],
    );
  }
}
