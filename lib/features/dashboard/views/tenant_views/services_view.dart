import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_list_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/services_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_table.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_type.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_dropdown_menu.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_review.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/services_search.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServicesController servicesController = Get.find();
    final serviceListController = Get.find<ServiceListController>();
    final serviceBookedController = Get.find<ServiceBookedController>();
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: Obx(
        () => CustomScrollView(
          controller: servicesController.selectedServiceType.value == 'Services'
              ? serviceListController.scrollController
              : serviceBookedController.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: DrawerItemsAppbar(
                      title:
                          servicesController.selectedServiceType.value ==
                              'Services'
                          ? 'Services'
                          : 'Booked Services',
                    ),
                  ),
                  ServiceDropdownMenu(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                switchInCurve: Curves.linear,
                switchOutCurve: Curves.linear,
                child:
                    servicesController.selectedServiceType.value == 'Services'
                    ? Column(
                        key: ValueKey('Services'),
                        children: [
                          SizedBox(height: 16.h),
                          ServicesSearch(),
                          SizedBox(height: 12.h),
                          ServiceReview(),
                        ],
                      )
                    : Column(
                        key: ValueKey('Booked Service'),
                        children: [
                          SizedBox(height: 16.h),
                          ServiceBookedType(),
                          // SizedBox(height: 12.h),
                          // ServiceBookedFilter(),
                          SizedBox(height: 20.h),
                          ServiceBookedTable(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
