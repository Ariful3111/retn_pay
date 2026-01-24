import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CreateTicketField extends StatelessWidget {
  const CreateTicketField({super.key});

  @override
  Widget build(BuildContext context) {
    SupportController supportController = Get.find();
    return Column(
      children: [
        CustomDropdownMenu(
          alignmentGeometry: Alignment(0.2, 1),
          label: CustomTextSecondary(text: 'Select Category*'),
          onSelect: (value) {
            supportController.ticketCategory.value = value!;
          },
          option: supportController.ticketCategoryList,
          isSelect: supportController.ticketCategory,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20.h),
        myField(
          controller: supportController.issueController,
          labelText: 'Issue Title*',
          context: context,
        ),
        SizedBox(height: 20.h),
        myField(
          controller: supportController.descriptionController,
          labelText: 'Description*',
          maxLines: 3,
          isAlignLabelWithHint: true,
          context: context,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget myField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    int? maxLines,
    bool? isAlignLabelWithHint,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      controller: controller,
      labelText: labelText,
      borderRadius: 12.r,
      borderWidth: 1.r,
      focusBorderRadius: BorderRadius.circular(12.r),
      focusBorderWidth: 1.r,
      enableBorderRadius: BorderRadius.circular(12.r),
      enableBorderWidth: 1.r,
      maxLines: maxLines,
      isAlignLabelWithHint: isAlignLabelWithHint,
    );
  }
}
