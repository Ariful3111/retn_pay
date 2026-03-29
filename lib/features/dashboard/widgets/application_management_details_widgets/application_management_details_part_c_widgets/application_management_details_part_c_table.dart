import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c_fields.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c_sell.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartCTable
    extends GetWidget<ApplicationManagementDetailsTableController> {
  final int itemIndex;
  final bool isDark;

  const ApplicationManagementDetailsPartCTable({
    super.key,
    required this.itemIndex,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final item = controller.disclosureItems[itemIndex];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.hasAdditionalFields) ...[
            ApplicationManagementDetailsPartCFields(
              item: item,
              itemIndex: itemIndex,
            ),
            SizedBox(height: 12.h),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _label(item)),

              if (item.hasDateField) ...[
                _dateField(context, item),
              ] else ...[
                _checkBox(
                  value: item.yesAnswer,
                  onChange: (v) => controller.updateYesAnswer(itemIndex, v),
                ),
                _checkBox(
                  value: item.noAnswer,
                  onChange: (v) => controller.updateNoAnswer(itemIndex, v),
                ),
              ],
            ],
          ),
          if (item.label.contains('I intend to sell'))
            ApplicationManagementDetailsPartCSell(index: itemIndex),
        ],
      );
    });
  }

  Widget _label(DisclosureItem item) {
    return CustomTextSecondary(
      text: item.label,
      fontSize: 14.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }

  Widget _checkBox({required bool value, required ValueChanged onChange}) {
    return Expanded(
      child: Center(
        child: CustomCheckBox(isChecked: value, onChange: onChange),
      ),
    );
  }

  Widget _dateField(BuildContext context, DisclosureItem item) {
    return Row(
      children: [
        CustomTextSecondary(
          text: item.selectedDate != null
              ? '${item.selectedDate!.day}/${item.selectedDate!.month}/${item.selectedDate!.year}'
              : '',
          fontSize: 12.sp,
          color: item.selectedDate != null
              ? (isDark ? AppColors.whiteColor : AppColors.darkTextColor)
              : AppColors.secondaryTextColor,
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () => _pickDate(context),
          child: Image.asset(IconsPath.date, height: 20.h, width: 20.w),
        ),
      ],
    );
  }

  void _pickDate(BuildContext context) {
    DatePicker.pickDate(
      context: context,
      onDateSelected: (date) {
        controller.updateSelectedDate(itemIndex, date);
      },
    );
  }
}
