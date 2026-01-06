import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landrord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddNewPropertyFeatures extends StatelessWidget {
  const AddNewPropertyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewPropertyController addNewPropertyController = Get.find();
    return AddNewPropertyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Key Features & Amenities:',
            fontSize: 20.sp,
            color: isDark ? null : AppColors.darkContainer,
          ),
          SizedBox(height: 12.h),
          ...List.generate(addNewPropertyController.featureList.length, (
            index,
          ) {
            return Obx(() {
              bool isChecked = addNewPropertyController.selectedFeature
                  .contains(index);
              return Row(
                children: [
                  CustomCheckBox(
                    isChecked: isChecked,
                    onChange: (value) {
                      if (value) {
                        addNewPropertyController.selectedFeature.add(index);
                      } else {
                        addNewPropertyController.selectedFeature.remove(index);
                      }
                    },
                  ),
                  CustomTextPrimary(text: addNewPropertyController.featureList[index],fontSize: 14.sp,fontWeight: FontWeight.w400,)
                ],
              );
            });
          }),
        ],
      ),
    );
  }
}
