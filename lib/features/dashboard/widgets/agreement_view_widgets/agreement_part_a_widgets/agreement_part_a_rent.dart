import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartARent extends GetWidget<AgreementPartAController> {
  const AgreementPartARent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    final List<String> paymentOptions = ['Week', 'Fortnight', 'Calendar month'];

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rent Amount Field
          helper.agreementField(
            label: 'Rent amount (\$)',
            controller: controller.rentAmountController,
            isDark: isDark,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.h),

          // Payment Period Label
          CustomTextPrimary(
            text: 'To be paid per:',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
          ),
          SizedBox(height: 12.h),

          // Payment Options - Wrapped Layout
          Wrap(
            spacing: 20.w,
            runSpacing: 12.h,
            children: paymentOptions
                .map((option) => _buildPaymentOption(option, isDark))
                .toList(),
          ),
          SizedBox(height: 16.h),

          // Rent Payment Date Field
          helper.dateFieldWithPicker(
            context: context,
            labelText: 'Rent is to be paid',
            controller: controller.rentPaymentDateController,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  // Build payment option checkbox
  Widget _buildPaymentOption(String option, bool isDark) {
    final bool isSelected = controller.selectedPaymentType.value == option;

    return GestureDetector(
      onTap: () => controller.selectedPaymentType.value = option,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCheckBox(
            isChecked: isSelected,
            onChange: (_) {
              controller.selectedPaymentType.value = option;
            },
          ),
          SizedBox(width: 8.w),
          CustomTextSecondary(
            text: option,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
        ],
      ),
    );
  }
}
