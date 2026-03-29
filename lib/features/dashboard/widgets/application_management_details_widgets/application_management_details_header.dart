import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_list_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsHeader
    extends GetWidget<ApplicationManagementDetailsController> {
  const ApplicationManagementDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkContainer : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Residential Rental Application',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.secondaryBorder,
          ),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: 'Residential Tenancies Act 1997 Section 29C',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.secondaryBorder,
          ),
          SizedBox(height: 12.h),
          CustomTextSecondary(
            text:
                'This form may be used by residential rental providers (rental providers, formerly landlords) to seek information from applicants to a rental property.\n'
                'It includes:',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          Padding(
            padding: EdgeInsets.only(left:  8.w),
            child: ApplicationManagementDetailsListText(items: controller.items),
          ),
        ],
      ),
    );
  }
}
