import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PaymentManagementExport extends StatelessWidget {
  final List<String> exportList;
  final RxInt selectedIndex;
  final AlignmentGeometry? alignmentGeometry;
  const PaymentManagementExport({
    super.key,
    required this.exportList,
    required this.selectedIndex, this.alignmentGeometry,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment:alignmentGeometry?? Alignment(0.9, -0.560),
      child: Container(
        padding: EdgeInsets.all(16.r),
        height: 110.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          border: Border.all(width: 1.16.w, color: AppColors.whiteBorder),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 28,
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
            ),
          ],
        ),
        child: Column(
          children: List.generate(exportList.length, (index) {
            return Obx(() {
              final isSelected = selectedIndex.value == index;
              return GestureDetector(
                onTap: () {
                  selectedIndex.value = index;
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    gradient: isSelected ? AppColors.primaryColor : null,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: CustomTextSecondary(
                      text: exportList[index],
                      fontSize: 14.sp,
                      color: isSelected
                          ? AppColors.whiteColor
                          : isDark
                          ? AppColors.darkAppBar
                          : AppColors.darkContainer,
                    ),
                  ),
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
