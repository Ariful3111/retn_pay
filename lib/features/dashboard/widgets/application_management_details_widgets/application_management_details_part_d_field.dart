import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class ApplicationManagementDetailsPartDField
    extends GetWidget<ApplicationManagementDetailsController> {
  final String label;
  final TextInputType? keyboardType;
  const ApplicationManagementDetailsPartDField({
    super.key,
    required this.label,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final readOnly = !controller.isEditable.value;
      return Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: CustomTextField(
          enableBorderRadius: BorderRadius.circular(12.r),
          enableBorderWidth: 1.r,
          focusBorderRadius: BorderRadius.circular(12.r),
          focusBorderWidth: 1.r,
          borderRadius: 12.r,
          borderWidth: 1.r,
          controller: controller.getFieldController(label),
          labelText: label,
          hintText: 'Enter $label',
          fillColor: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          readOnly: readOnly,
          keyboardType: keyboardType,
        ),
      );
    });
  }
}
