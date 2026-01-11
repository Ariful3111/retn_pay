import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_item.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_key_features.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_quick_actions.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_reminder.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_rent_notice.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_upcoming_payment.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_contact.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_graph.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_landlord_plan.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_landlord_quick_action.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/landlord_upcoming_payment.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/property_promotion.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/repair_request.dart';

class DashboardProperties extends StatelessWidget {
  const DashboardProperties({super.key});

  @override
  Widget build(BuildContext context) {
    int userIndex = 3;
    DashboardController dashboardController = Get.find();
    return Column(
      children: [
        SizedBox(height: 24.h),
        GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 188 / 85,
          ),
          itemBuilder: (context, index) {
            final list = dashboardController.dashboardItem[index];
            return DashboardItem(
              icon: list['icon'],
              title: list['title'],
              value: list['value'],
            );
          },
        ),
        if (userIndex == 1 || userIndex == 2) DashboardGraph(),
        SizedBox(height: 20.h),
        if (userIndex == 0) DashboardUpcomingPayment(),
        if (userIndex == 1 || userIndex == 2||userIndex==3) LandlordUpcomingPayment(),
        SizedBox(height: 20.h),
        DashboardReminder(),
        Obx(
          () => SizedBox(
            height: dashboardController.reminderList.isEmpty ? 0 : 20.h,
          ),
        ),
        if (userIndex == 1) PropertyPromotion(),
        if (userIndex == 1) DashboardLandlordPlan(),
        DashboardRentNotice(),
        SizedBox(height: 20.h),
        DashboardQuickActions(),
        SizedBox(height: 20.h),
        Obx(
          () => dashboardController.isQuickActions.value
              ? AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeOut,
                  child: Column(
                    children: [
                      if (userIndex == 0)
                        Column(
                          children: [
                            LandlordContact(),
                            SizedBox(height: 13.07.h),
                            RepairRequest(),
                            SizedBox(height: 20.h),
                            DashboardKeyFeatures(),
                          ],
                        ),
                      if (userIndex == 1 || userIndex == 2)
                        DashboardLandlordQuickAction(),
                    ],
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
