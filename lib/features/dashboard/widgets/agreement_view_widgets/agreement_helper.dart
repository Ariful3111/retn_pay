import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementHelper {
  Widget agreementField({
    required String label,
    required TextEditingController controller,
    required bool isDark,
    int? maxLines,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: CustomTextField(
        enableBorderRadius: BorderRadius.circular(12.r),
        enableBorderWidth: 1.r,
        focusBorderRadius: BorderRadius.circular(12.r),
        focusBorderWidth: 1.r,
        borderRadius: 12.r,
        borderWidth: 1.r,
        controller: controller,
        labelText: label,
        fillColor: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        maxLines: maxLines,
        keyboardType: keyboardType,
      ),
    );
  }

  Widget divider({required bool isDark}) {
    return Divider(
      color: isDark ? AppColors.darkBorderPrimary : AppColors.secondaryBorder,
    );
  }

  Widget richText({required String title, required String spantext,Color? color,Color? spanColor}) {
    return CustomTextSpan(
      title: title,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: color ?? AppColors.darkContainer,
      spanColor: spanColor ?? AppColors.darkContainer,
      spantext: spantext,
    );
  }

  Widget checkboxWithText({
    required String text,
    required bool isChecked,
    required ValueChanged onChanged,
  }) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onChange: onChanged),
        CustomTextSecondary(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget dateFieldWithPicker({
    required BuildContext context,
    required String labelText,
    required TextEditingController controller,
    required bool isDark,
    DateTime? initialDate,
  }) {
    return CustomDateField(
      fillColor: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      label: labelText,
      controller: controller,
      onTap: () {
        DatePicker.pickDate(
          context: context,
          initialDate: initialDate,
          onDateSelected: (date) {
            controller.text =
                "${date.day.toString().padLeft(2, '0')}/"
                "${date.month.toString().padLeft(2, '0')}/"
                "${date.year}";
          },
        );
      },
    );
  }

  Widget section({
    required String title,
    required Widget child,
    required bool isDark,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: title,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          ),
          SizedBox(height: 6.h),
          child,
        ],
      ),
    );
  }
}
