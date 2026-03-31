import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartA extends StatelessWidget {
  const AgreementPartA({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomTextSecondary(
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkContainer,
          text:
              'This agreement is between the residential rental provider (rental provider) and the renter(s) listed on this form. ',
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 1.5.h,
          color: isDark
              ? AppColors.darkBorderPrimary
              : AppColors.secondaryBorder,
        ),
        SizedBox(height: 16.h),
        _buildCollapsibleList(),
      ],
    );
  }

  Widget _buildCollapsibleList() {
    final controller = Get.find<AgreementPartAController>();
    return Column(
      children: List.generate(controller.title.length, (index) {
        return _CollapsibleItem(index: index);
      }),
    );
  }
}

class _CollapsibleItem extends StatelessWidget {
  final int index;

  const _CollapsibleItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AgreementPartAController>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;

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
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkTextColor,
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
                            IconsPath.downArrow,
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
  }
}
