import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementDetailsWidgets
    extends GetWidget<ApplicationManagementDetailsController> {
  const ApplicationManagementDetailsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Column(
          children: List.generate(controller.title.length, (index) {
            return Obx(() {
              final isSelected = controller.isOpenList[index];
              return Column(
                key: ValueKey(index),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSecondary
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextPrimary(
                                text: controller.title[index],
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.whiteColor
                                    : AppColors.primaryColorDark,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isOpenList[index] =
                                    !controller.isOpenList[index];
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: AnimatedRotation(
                                  turns: isSelected
                                      ? 0.5
                                      : 0.0, // 180° rotation
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                  child: Image.asset(
                                    IconsPath.downArrow, // always same icon
                                    height: 8.h,
                                    width: 16.w,
                                    color: isDark
                                        ? AppColors.whiteColor
                                        : AppColors.secondaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          child: isSelected
                              ? Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: controller.widgetList[index],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            });
          }),
        ),
        SizedBox(height: 4.h),
        CustomPrimaryButton(
          onPressed: () {},
          text: 'Submit',
          height: 40.h,
          width: 100.w,
          borderRadius: BorderRadius.circular(6.r),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
