import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/upcoming_payment_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/upcoming_payment_table.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/service_vendor_widgets/upcoming_services.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordUpcomingPayment extends GetWidget<UpcomingPaymentController> {
  const LandlordUpcomingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardLandlordController dashboardLandlordController = Get.find();
    return Column(
      children: [
        Obx(() {
          return controller.isLoading.value
              ? ButtonLoading()
              : controller.upcomingPayments.value?.data?.isEmpty ?? true
              ? SizedBox()
              : Container(
                  width: MediaQuery.widthOf(context),
                  padding: EdgeInsets.all(16.r),
                  height: 66.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextPrimary(
                        text: userIndex == 3
                            ? 'Upcoming Services'
                            : 'Upcoming Payment',
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
                                  widget: UpcomingPaymentFilter(),
                                  isDay:
                                      dashboardLandlordController.isDay.value,
                                  onTap: (int index) {
                                    dashboardLandlordController.isDay.value =
                                        index;
                                    calenderFilter(
                                      index: index,
                                      selectedDay: dashboardLandlordController
                                          .selectedDay,
                                      rangeStart: dashboardLandlordController
                                          .rangeStart,
                                      rangeEnd:
                                          dashboardLandlordController.rangeEnd,
                                      rangeSelectionMode:
                                          dashboardLandlordController
                                              .rangeSelectionMode,
                                      focusedDay: dashboardLandlordController
                                          .focusedDay,
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
                );
        }),
        SizedBox(height: 12.h),
        if (userIndex == 1 || userIndex == 2) UpcomingPaymentTable(),
        if (userIndex == 3) UpcomingServices(),
      ],
    );
  }
}
