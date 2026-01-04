import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/add_new_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementRow extends StatelessWidget {
  const PropertyManagementRow({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewPropertyController addNewPropertyController = Get.find();
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: addNewPropertyController.isNewProperty.value
            ? Center(
                child: CustomTextPrimary(
                  text: 'Property Information',
                  fontSize: 24.sp,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextPrimary(text: 'Property', fontSize: 24.sp),
                  GestureDetector(
                    onTap: () {
                      addNewPropertyController.isNewProperty.value =
                          !addNewPropertyController.isNewProperty.value;
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkPrimary
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          width: 1.r,
                          color: isDark
                              ? AppColors.darkBorderPrimary
                              : AppColors.primaryBorder,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: AppColors.dropShadowColor.withValues(
                              alpha: 0.06,
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(IconsPath.add, height: 24.h, width: 24.w),
                          CustomTextSecondary(text: 'New Property'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
