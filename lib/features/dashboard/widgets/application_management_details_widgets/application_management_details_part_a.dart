import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementDetailsPartA extends GetWidget<ApplicationManagementDetailsController> {
  const ApplicationManagementDetailsPartA({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 1.h,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.darkSecondaryText,
          ),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(controller.informationTitle.length, (index) {
            return Obx(() {
              final isSelected = controller.isInformationOpenList[index];
        
              return Column(
                key: ValueKey(index),
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomTextPrimary(
                              text: controller.informationTitle[index],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColorDark,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.isInformationOpenList[index] =
                                  !controller.isInformationOpenList[index];
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: AnimatedRotation(
                                turns: isSelected ? 0.5 : 0.0, // 180° rotation
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
                        duration:  Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        child: isSelected
                            ? Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: controller.informationWidgetList[index],
                              )
                            : SizedBox.shrink(),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              );
            });
          }),
        ),
      ],
    );
  }
}

