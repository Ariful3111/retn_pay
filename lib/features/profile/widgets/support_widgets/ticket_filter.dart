import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class TicketFilter extends StatelessWidget {
  const TicketFilter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return Align(
      alignment: Alignment.centerRight,
      child: MenuAnchor(
        builder: (context, controller, child) {
          return CustomFilterAppbar(
            height: 32.h,
            width: 71.w,
            onTap: () {
              controller.isOpen ? controller.close() : controller.open();
            },
          );
        },
        alignmentOffset: Offset(-40, 0),
        style: MenuStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        controller: MenuController(),
        menuChildren: [
          Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.16.r,
          color: isDark ? AppColors.darkBorderPrimary : Color(0xFFF1F1F2),
        ),
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 28,
            color: AppColors.dropShadowColor.withValues(alpha: 0.10),
          ),
        ],
      ),
      child: Column(
        children: List.generate(supportController.filterList.length, (
          index,
        ) {
          return Obx(() {
            final isSelected =
                supportController.filterIndex.value == index;
            return MenuItemButton(
              onPressed: () {
                supportController.filterIndex.value = index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: isSelected ? AppColors.primaryColor : null,
                ),
                child: CustomTextSecondary(
                  text: supportController.filterList[index],
                  fontSize: 14.sp,
                  color: isSelected
                      ? AppColors.whiteColor
                      : isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.darkContainer,
                ),
              ),
            );
          });
        }),
      ),
    ),
        ],
      ),
    );
  }
}
