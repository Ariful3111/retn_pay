import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_b_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartB extends GetWidget<AgreementPartBController> {
  const AgreementPartB({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column( 
      children: [
        AgreementHelper().divider(isDark: isDark),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(controller.title.length, (index) {
            return Obx(() {
              final isSelected = controller.isOpenList[index];
              return Column(
                key: ValueKey(index),
                children: [
                  Container(
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
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
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
                                  turns: isSelected ? 0.5 : 0.0,
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
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          child: isSelected
                              ? Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: controller.widgetList[index],
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
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
