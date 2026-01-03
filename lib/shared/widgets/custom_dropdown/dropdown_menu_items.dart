import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
class  DropdownMenuItems {
  dropdownMenuItem({required List option,required RxString isSelect,required BuildContext context, double? menuFontSize}) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return option.map((option) {
    bool selected = option == isSelect.value;
    return DropdownMenuEntry<String>(
      value: option,
      label: option,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        backgroundColor: isDark
            ? WidgetStatePropertyAll(AppColors.darkPrimary)
            : WidgetStatePropertyAll(AppColors.whiteColor),
      ),
      labelWidget: dropdownItem(
        gradient: selected ? AppColors.primaryColor : null,
        option: option,
        color: selected
            ? isDark
                  ? AppColors.darkSecondaryText
                  : AppColors.whiteColor
            : isDark
            ? AppColors.whiteColor
            : Color(0xFF091E42),
        fontSize: menuFontSize ?? 14.sp,
      ),
    );
  }).toList();
}
Widget dropdownItem({
    LinearGradient? gradient,
    required String option,
    required Color color,
    required double fontSize,
  }) {
    return Container(
      height: 33.h,
      width: 119.w,
      padding: EdgeInsets.only(left: 6.27.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.27.r),
        gradient: gradient,
      ),
      child: Center(
        child: CustomTextSecondary(
          text: option,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
  
}




