import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/add_new_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class PropertyOwnerDocumentField extends StatelessWidget {
  const PropertyOwnerDocumentField({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewPropertyController addNewPropertyController = Get.find();
    return Column(
      children: [
        myField(
          controller: addNewPropertyController.propertyNameController,
          label: 'Property Name',
          context: context,
        ),
        SizedBox(height: 20.h),
        myField(
          controller: addNewPropertyController.propertyAddressController,
          label: 'Address',
          context: context,
        ),
        SizedBox(height: 24.h),
        CustomPrimaryButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SuccessDialog(
                  title1: 'Property Documents Verified',
                  subtitle: 'You can update your property information now.',
                  button: CustomPrimaryButton(
                    onPressed: () {
                      Navigator.pop(context);
                      addNewPropertyController.isNewProperty.value =
                          !addNewPropertyController.isNewProperty.value;
                    },
                    text: 'Back to Property Management',
                    height: 40.h,
                    width: 259.w,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                );
              },
            );
          },
          text: 'Submit',
          height: 52.h,
          width: 119.w,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ],
    );
  }

  myField({
    required TextEditingController controller,
    required String label,
    required BuildContext context,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      labelText: label,
      fillColor: isDark ? null : AppColors.whiteColor,
    );
  }
}
