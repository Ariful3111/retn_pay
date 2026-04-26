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
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordCalenderView extends GetView<LandlordCalenderController> {
  const LandlordCalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
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
                    controller: controller.searchController,
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
                              isDay: controller.isDay.value,
                              onTap: (index) {
                                controller.isDay.value = index;
                                calenderFilter(
                                  index: index,
                                  selectedDay: controller.selectedDay,
                                  rangeStart: controller.rangeStart,
                                  rangeEnd: controller.rangeEnd,
                                  rangeSelectionMode:
                                      controller.rangeSelectionMode,
                                  focusedDay: controller.focusedDay,
                                );
                              },
                              onApply: () {
                                if (controller.rangeStart.value != null) {
                                  controller.focusedDay.value =
                                      controller.rangeStart.value!;
                                } else {
                                  controller.focusedDay.value =
                                      controller.selectedDay.value;
                                }
                                controller.applyFilter();
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
            CustomTextSecondary(
              text: controller.selectedMonthLabel,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 16.h),
            controller.isLoading.value
                ? ButtonLoading()
                : LandlordEventCalender(),
          ],
        ),
      );
    });
  }
}
