import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/services_controller.dart';
import 'package:renter_pay/features/dashboard/views/service_booked_view.dart';
import 'package:renter_pay/features/dashboard/widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/service_review.dart';
import 'package:renter_pay/features/dashboard/widgets/services_search.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown_menu.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServicesController servicesController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: DrawerItemsAppbar(
                    title:
                        servicesController.selectedServiceType.value == 'Search'
                        ? 'Services'
                        : 'Booked Services',
                  ),
                ),
                SizedBox(
                  height: 38.h,
                  width: 170.w,
                  child: Center(
                    child: CustomDropdownMenu(
                      offset: Offset(1, 2),
                      onSelect: (value) {
                        servicesController.selectedServiceType.value = value!;
                        servicesController.isSelected.value = true;
                      },
                      option: servicesController.serviceType,
                      isSelect: servicesController.selectedServiceType,
                      borderWidth: 1.r,
                      focusBorderWidth: 1.r,
                      borderRadius: 6.r,
                      focusBorderRadius: 6.r,
                      expandedInsets: EdgeInsets.zero,
                      textAlign: TextAlign.start,
                      contentPadding: EdgeInsets.zero,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
              Expanded(
                child:AnimatedSwitcher(duration: Duration(milliseconds: 300),
                switchInCurve: Curves.linear,
                switchOutCurve: Curves.linear,
                child: servicesController.selectedServiceType.value == 'Search' ?Column(
                  key: ValueKey('Search'),
                  children: [
                    SizedBox(height: 16.h),
                    ServicesSearch(),
                    SizedBox(height: 12.h),
                    ServiceReview(),
                  ],
                ):ServiceBookedView(key: ValueKey('Booked Service'),),
                ) 
              ),
            
          ],
        ),
      ),
    );
  }
}
