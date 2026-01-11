import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/upcoming_payment_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/upcoming_payment_table.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordUpcomingPayment extends StatelessWidget {
  const LandlordUpcomingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    int userIndex = 3;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardLandlordController dashboardLandlordController = Get.find();
    return Column(
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
              CustomTextPrimary(text:userIndex==3?'Upcoming Services': 'Upcoming Payment', fontSize: 20.sp),
              CustomFilterAppbar(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Obx(
                        () => CustomCalenderFilter(
                          alignmentGeometry: Alignment(0, 0.4),
                          widget: UpcomingPaymentFilter(),
                          isDay: dashboardLandlordController.isDay.value,
                          onTap: (int index) {
                            dashboardLandlordController.isDay.value = index;
                            calenderFilter(
                        index: index,
                        selectedDay: dashboardLandlordController.selectedDay,
                        rangeStart: dashboardLandlordController.rangeStart,
                        rangeEnd: dashboardLandlordController.rangeEnd,
                        rangeSelectionMode:
                            dashboardLandlordController.rangeSelectionMode,
                      );
                          }, onApply: () {  },
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
        UpcomingPaymentTable(),
      ],
    );
  }
}
