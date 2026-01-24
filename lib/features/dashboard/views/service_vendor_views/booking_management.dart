import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_management_export.dart';
import 'package:renter_pay/features/dashboard/widgets/service_vendor_widgets/booking_management_table.dart';
import 'package:renter_pay/features/dashboard/widgets/service_vendor_widgets/booking_management_type.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class BookingManagement extends StatelessWidget {
  const BookingManagement({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    BookingManagementController bookingManagementController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark ? null : AppColors.userBackground,
      child: ListView(
        children: [
          DrawerItemsAppbar(title: 'Booking Management'),
          SizedBox(height: 24.h),
          BookingManagementType(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 54.h,
                width: 305.w,
                child: CustomTextField(
                  padding: EdgeInsets.zero,
                  controller: bookingManagementController.searchController,
                  labelText: 'Search',
                  fillColor: isDark ? null : AppColors.whiteColor,
                  prefixIcon: Padding(
                    padding: EdgeInsetsGeometry.only(left: 16.w),
                    child: Image.asset(
                      IconsPath.homeSearch,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
              ),
              CustomFilterAppbar(
                title: 'Export',
                icon: IconsPath.export,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return Material(
                        color: Colors.transparent,
                        child: PaymentManagementExport(
                          alignmentGeometry: Alignment(0.9, -0.500),
                          exportList: bookingManagementController.exportType,
                          selectedIndex:
                              bookingManagementController.selectedExport,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20.h),
          BookingManagementTable(),
        ],
      ),
    );
  }
}
