import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_range_calendar.dart';
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
   
      return SliverAppBar(
        backgroundColor: Colors.transparent,
        leading: CustomAppbarLeading(
          icon: IconsPath.profileDrawer,
          onTap: () {
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
          SizedBox(width: 8.w,),
          CustomFilterAppbar(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomCalenderFilter(widget: DashboardRangeCalendar());
                },
              );
            },
          ),
          SizedBox(width: 20.w,)
        ],
      );
  }
}
