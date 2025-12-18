import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service_details_commit.dart';
import 'package:renter_pay/features/dashboard/widgets/service_dropdown_menu.dart';
import 'package:renter_pay/features/dashboard/widgets/service_search_info.dart';
import 'package:renter_pay/features/dashboard/widgets/service_details_widgets.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ServiceSearchDetails extends StatelessWidget {
  const ServiceSearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceSearchController serviceSearchController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomAppbarLeading(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8.w),
                  CustomAppbar(title: 'Services'),
                ],
              ),
              ServiceDropdownMenu(),
            ],
          ),
          SizedBox(height: 16.h),
          ServiceSearchInfo(),
          SizedBox(height: 20.h),
          ServiceDetailsWidgets(
            widgetList: serviceSearchController.widgetList,
            widgetTitleList: serviceSearchController.widgetTitle,
            widgetIndex: serviceSearchController.widgetIndex,
          ),
          SizedBox(height: 20.h),
          ServiceDetailsCommit(),
        ],
      ),
    );
  }
}
