import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddNewPropertyInfoImages extends StatelessWidget {
  const AddNewPropertyInfoImages({super.key});

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
        itemCount: addNewPropertyController.images.length < 5
            ? addNewPropertyController.images.length
            : 4,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.38.r),
              image: DecorationImage(
                image: FileImage(
                  File(addNewPropertyController.images[index].path),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child:
                addNewPropertyController.images.length > 3 &&
                    addNewPropertyController.images[index] ==
                        addNewPropertyController.images[3]
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
                        text: (addNewPropertyController.images.length - 4)
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
