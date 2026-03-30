import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartDPaid extends GetWidget<ApplicationManagementDetailsController> {

  const ApplicationManagementDetailsPartDPaid({super.key, });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'To be paid per:',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 20.w,
            runSpacing: 12.h,
            children: [
              _buildOption('Week', isDark),
              _buildOption('Fortnight', isDark),
              _buildOption('Calendar month', isDark),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildOption(String value,bool isDark) {
    final bool isSelected = controller.selectedPaymentType.value == value;
    return GestureDetector(
      onTap: () => controller.selectedPaymentType.value = value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCheckBox(
            isChecked: isSelected,
            onChange: (_) {
              controller.selectedPaymentType.value = value;
            },
          ),
          SizedBox(width: 6.w),
          CustomTextSecondary(
            text: value,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
