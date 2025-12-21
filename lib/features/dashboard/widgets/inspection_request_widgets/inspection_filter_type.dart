import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionFilterType extends StatelessWidget {
  const InspectionFilterType({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionRequestController inspectionRequestController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
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
        children: List.generate(inspectionRequestController.filterList.length, (
          index,
        ) {
          return Obx(() {
            final isSelected =
                inspectionRequestController.filterIndex.value == index;
            return MenuItemButton(
              onPressed: () {
                inspectionRequestController.filterIndex.value = index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: isSelected ? AppColors.primaryColor : null,
                ),
                child: CustomTextSecondary(
                  text: inspectionRequestController.filterList[index],
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
    );
  }
}
