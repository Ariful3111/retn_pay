import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c_description.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c_table.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c_table_header.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

/// Main Widget
class ApplicationManagementDetailsPartC extends GetWidget<ApplicationManagementDetailsTableController> {
  const ApplicationManagementDetailsPartC({super.key});

  @override
  Widget build(BuildContext context) {
 final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      child: Column(
        children: [
          ApplicationManagementDetailsPartCDescription(isDark: isDark),
          SizedBox(height: 16.h),

          ApplicationManagementDetailsPartCTableHeader(isDark: isDark),
          SizedBox(height: 16.h),

          /// 🔹 List
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.disclosureItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return ApplicationManagementDetailsPartCTable(
                    itemIndex: index,
                    isDark: isDark,
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 24.h),

          CustomTextSecondary(
      text: 'Further information about any disclosures outlined above',
      fontSize: 14.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  
}
