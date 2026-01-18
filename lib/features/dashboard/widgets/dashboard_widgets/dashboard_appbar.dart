import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_range_calendar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_favorite_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: CustomAppbarLeading(
        icon: IconsPath.profileDrawer,
        onTap: () {
          HitTestBehavior.opaque;
          showDialog(
            context: context,
            builder: (context) {
              return CustomDrawer();
            },
          );
        },
      ),
      titleSpacing: 0.w,
      title: CustomAppbar(title: 'Dashboard'),
      actions: [
        CustomFavoriteAppbar(
          onFavorite: () {
            Get.toNamed(AppRoutes.favorite);
          },
        ),
        SizedBox(width: 8.w),
        CustomNotificationButton(),
        SizedBox(width: 8.w),
        CustomFilterAppbar(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Obx(
                  () => CustomCalenderFilter(
                    widget: DashboardRangeCalendar(),
                    isDay: dashboardController.isDay.value,
                    onTap: (int index) {
                      dashboardController.isDay.value = index;
                      calenderFilter(
                        index: index,
                        selectedDay: dashboardController.selectedDay,
                        rangeStart: dashboardController.rangeStart,
                        rangeEnd: dashboardController.rangeEnd,
                        rangeSelectionMode:
                            dashboardController.rangeSelectionMode,
                        focusedDay: dashboardController.focusedDay,
                      );
                    },
                    onApply: () {},
                  ),
                );
              },
            );
          },
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
