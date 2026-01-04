import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AddNewPropertyInspection extends StatelessWidget {
  const AddNewPropertyInspection({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewPropertyController addNewPropertyController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AddNewPropertyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Inspection:',
            fontSize: 20.sp,
            color: isDark ? null : AppColors.darkContainer,
          ),
          SizedBox(height: 12.h),
          ...List.generate(addNewPropertyController.inspectionType.length, (
            index,
          ) {
           return Obx(() {
              bool isChecked =
                  addNewPropertyController.inspectionNo.value == index;
              return Row(
                children: [
                  CustomCheckBox(
                    isChecked: isChecked,
                    onChange: (value) {
                      addNewPropertyController.inspectionNo.value = index;
                    },
                  ),
                  CustomTextSecondary(text: addNewPropertyController.inspectionType[index],fontSize: 14.sp,fontWeight: FontWeight.w400,)
                ],
              );
            });
          }),
        ],
      ),
    );
  }
}
