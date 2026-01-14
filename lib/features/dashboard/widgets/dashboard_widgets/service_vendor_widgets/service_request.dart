import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/service_vendor_widgets/service_request_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/service_vendor_widgets/service_request_table.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceRequest extends StatelessWidget {
  const ServiceRequest({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceVendorDashboardController serviceVendorDashboardController = Get.find();
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Container(
            width: MediaQuery.widthOf(context),
            padding: EdgeInsets.all(16.r),
            height: 66.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextPrimary(
                  text: 'Service Request',
                  fontSize: 20.sp,
                ),
                CustomFilterAppbar(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Obx(
                          () => CustomCalenderFilter(
                            alignmentGeometry: Alignment(0, 0.4),
                            widget: ServiceRequestFilter(),
                            isDay: serviceVendorDashboardController.isDay.value,
                            onTap: (int index) {
                              serviceVendorDashboardController.isDay.value = index;
                              calenderFilter(
                                index: index,
                                selectedDay:
                                    serviceVendorDashboardController.selectedDay,
                                rangeStart:
                                    serviceVendorDashboardController.rangeStart,
                                rangeEnd: serviceVendorDashboardController.rangeEnd,
                                rangeSelectionMode: serviceVendorDashboardController
                                    .rangeSelectionMode,
                              );
                            },
                            onApply: () {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
         ServiceRequestTable()
        ],
      ),
    );
  }
}