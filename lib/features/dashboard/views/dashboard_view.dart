import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_item.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_key_features.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_quick_actions.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_reminder.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_rent_notice.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_upcoming_payment.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_upcoming_payment.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/property_promotion.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_contact.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/repair_request.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    int userIndex = Get.find<UserRoleController>().selectedIndex.value;
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: CustomScrollView(
        controller: dashboardController.scrollController,
        slivers: [
          DashboardAppbar(),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(
              top: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
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
                    SizedBox(height: 20.h),
                  if(userIndex==0)  DashboardUpcomingPayment(),
                  if(userIndex==1) LandlordUpcomingPayment(),
                    SizedBox(height: 20.h),
                    DashboardReminder(),
                    Obx(
                      () => SizedBox(
                        height: dashboardController.reminderList.isEmpty
                            ? 0
                            : 20.h,
                      ),
                    ),
                    DashboardRentNotice(),
                    SizedBox(height: 20.h),
                    if(userIndex == 1) PropertyPromotion(),
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
                                  LandlordContact(),
                                  SizedBox(height: 13.07.h),
                                  RepairRequest(),
                                  SizedBox(height: 20.h),
                                  DashboardKeyFeatures(),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
