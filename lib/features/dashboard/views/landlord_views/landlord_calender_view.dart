import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/landlord_calender_widgets/landlord_calender_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/landlord_calender_widgets/landlord_event_calender.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter.dart';
import 'package:renter_pay/shared/widgets/custom_calender/custom_calender_filter_helper.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordCalenderView extends StatelessWidget {
  const LandlordCalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    LandlordCalenderController landlordCalenderController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: isDark ? null : AppColors.userBackground,
      padding: EdgeInsets.all(20.r),
      child: ListView(
        children: [
          DrawerItemsAppbar(title: 'Calender'),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 48.h,
                width: 280.w,
                child: CustomTextField(
                  padding: EdgeInsets.zero,
                  controller: landlordCalenderController.searchController,
                  fillColor: isDark ? null : AppColors.whiteColor,
                  labelText: 'Search',
                  prefixIcon: Padding(
                    padding: EdgeInsetsGeometry.only(left: 6.w),
                    child: Image.asset(
                      IconsPath.homeSearch,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
              ),
              CustomFilterAppbar(
                height: 48.h,
                width: 99.w,
                radius: 12.r,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Obx(
                        () => Material(
                          color: Colors.transparent,
                          child: CustomCalenderFilter(
                            widget: LandlordCalenderFilter(),
                            isDay: landlordCalenderController.isDay.value,
                            onTap: (index) {
                              landlordCalenderController.isDay.value = index;
                              calenderFilter(
                                index: index,
                                selectedDay:
                                    landlordCalenderController.selectedDay,
                                rangeStart:
                                    landlordCalenderController.rangeStart,
                                rangeEnd: landlordCalenderController.rangeEnd,
                                rangeSelectionMode: landlordCalenderController
                                    .rangeSelectionMode, focusedDay: landlordCalenderController.focusedDay,
                              );
                            },
                            onApply: () {
                              if (landlordCalenderController.rangeStart.value !=
                                  null) {
                                landlordCalenderController.focusedDay.value =
                                    landlordCalenderController
                                        .rangeStart
                                        .value!;
                              } else {
                                landlordCalenderController.focusedDay.value =
                                    landlordCalenderController
                                        .selectedDay
                                        .value;
                              }
                              landlordCalenderController.applyFilter();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Obx(
            () => CustomTextSecondary(
              text: landlordCalenderController.selectedMonthLabel,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          LandlordEventCalender(),
        ],
      ),
    );
  }
}
