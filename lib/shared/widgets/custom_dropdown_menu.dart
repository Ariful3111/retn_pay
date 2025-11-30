import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List option;
  final void Function(String?) onSelect;
  final RxString isSelect;
  final String labelText;
  final Color? selectedTrailingIconColor;
  final Color? trailingIconColor;
  const CustomDropdownMenu({
    super.key,
    required this.onSelect,
    required this.option,
    required this.isSelect,
    required this.labelText, this.selectedTrailingIconColor, this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return DropdownMenu<String>(
        initialSelection: isSelect.value,
        label: CustomTextSecondary(
          text: labelText,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          alignLabelWithHint: true,
          focusColor: Colors.transparent,
        ),
        trailingIcon: Image.asset(
          IconsPath.downArrow,
          height: 15.h,
          width: 10.w,
          color:trailingIconColor?? Color(0xFF868C98),
        ),

        selectedTrailingIcon: Image.asset(
          IconsPath.upArrow,
          height: 15.h,
          width: 10.w,
          color:selectedTrailingIconColor?? Color(0xFF868C98),
        ),
        width: MediaQuery.widthOf(context),
        menuStyle: MenuStyle(
          maximumSize: WidgetStatePropertyAll(Size(144.w, 115)),
          alignment: Alignment.bottomRight,
          elevation: WidgetStateProperty.all(6),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteLightBorder,
              width: 0.91.r,
            ),
          ),
        ),

        onSelected: onSelect,
        dropdownMenuEntries: option.map((option) {
          bool selected = option == isSelect.value;
          return DropdownMenuEntry<String>(
            value: option,
            label: option,
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
              backgroundColor: isDark
                  ? WidgetStatePropertyAll(AppColors.darkPrimary)
                  : null,
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
            ),
          );
        }).toList(),
      );
    });
  }

  Widget dropdownItem({
    LinearGradient? gradient,
    required String option,
    required Color color,
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
        child: CustomTextSecondary(text: option, fontSize: 14.sp, color: color),
      ),
    );
  }
}
