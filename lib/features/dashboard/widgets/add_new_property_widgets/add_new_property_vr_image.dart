import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddNewPropertyVrImage extends StatelessWidget {
  const AddNewPropertyVrImage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewPropertyController addNewPropertyController =
        Get.find<AddNewPropertyController>();
    return Obx(
      () => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 173 / 173,
        ),
        itemCount: addNewPropertyController.vrImages.length < 5
            ? addNewPropertyController.vrImages.length
            : 4,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.38.r),
              image: DecorationImage(
                image: FileImage(
                  File(addNewPropertyController.vrImages[index].path),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child:
                addNewPropertyController.vrImages.length > 3 &&
                    addNewPropertyController.vrImages[index] ==
                        addNewPropertyController.vrImages[3]
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: 30.sp,
                        fontWeight: FontWeight.w900,
                      ),
                      CustomTextPrimary(
                        text: (addNewPropertyController.vrImages.length - 4)
                            .toString(),
                        color: isDark ? null : AppColors.whiteColor,
                      ),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }
}
