import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List option;
  final void Function(String?) onSelect;
  final RxString isSelect;
  final Widget? label;
  final Color? selectedTrailingIconColor;
  final Color? trailingIconColor;
  final Offset? offset;
  final double? borderWidth;
  final double? focusBorderWidth;
  final double? borderRadius;
  final double? focusBorderRadius;
  final EdgeInsets? expandedInsets;
  final EdgeInsets? contentPadding;
  final TextAlign textAlign;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? fillColor;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final double? selectedTrailingIconHeight;
  final double? selectedTrailingIconWidth;
  final double? trailingIconHeight;
  final double? trailingIconWidth;
  const CustomDropdownMenu({
    super.key,
    required this.onSelect,
    required this.option,
    required this.isSelect,
    this.label,
    this.selectedTrailingIconColor,
    this.trailingIconColor,
    this.offset,
    this.borderWidth,
    this.focusBorderWidth,
    this.expandedInsets,
    this.borderRadius,
    this.focusBorderRadius,
    this.contentPadding,
    required this.textAlign,
    this.fontSize,
    this.enableBorder,
    this.focusBorder,
    this.textStyle,
    this.fillColor,
    this.selectedTrailingIconHeight,
    this.selectedTrailingIconWidth,
    this.trailingIconHeight,
    this.trailingIconWidth,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return DropdownMenu<String>(
        initialSelection: isSelect.value,
        textAlign: textAlign,
        textStyle:
            textStyle ??
            GoogleFonts.inter(
              fontSize: fontSize ?? 16.sp,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppColors.darkSecondaryText
                  : AppColors.secondaryTextColor,
            ),
        label: label,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: isDark
              ? fillColor ?? AppColors.darkPrimary
              : fillColor ?? AppColors.whiteColor,
          contentPadding: contentPadding,
          focusColor: Colors.transparent,
          enabledBorder:
              enableBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 9.4.r),
                borderSide: BorderSide(
                  width: borderWidth ?? 0.78.r,
                  color: isDark
                      ? AppColors.darkBorderPrimary
                      : AppColors.primaryBorder,
                ),
              ),
          focusedBorder:
              focusBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(focusBorderRadius ?? 9.4.r),
                borderSide: BorderSide(
                  width: focusBorderWidth ?? 0.78.r,
                  color: isDark
                      ? AppColors.darkBorderPrimary
                      : AppColors.primaryBorder,
                ),
              ),
        ),
        expandedInsets: expandedInsets,
        trailingIcon: Image.asset(
          IconsPath.downArrow,
          height: trailingIconHeight ?? 20.h,
          width: trailingIconWidth ?? 15.w,
          color: trailingIconColor ?? Color(0xFF868C98),
        ),
        selectedTrailingIcon: Image.asset(
          IconsPath.upArrow,
          height: selectedTrailingIconHeight ?? 20.h,
          width: selectedTrailingIconWidth ?? 15.w,
          color: selectedTrailingIconColor ?? Color(0xFF868C98),
        ),
        width: MediaQuery.widthOf(context),
        menuStyle: MenuStyle(
          maximumSize: WidgetStatePropertyAll(Size(144.w, 115.h)),
          alignment: Alignment.bottomRight,
          elevation: WidgetStateProperty.all(6),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          side: WidgetStateProperty.all(
            BorderSide(
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.whiteLightBorder,
              width: 0.91.r,
            ),
          ),
        ),
        alignmentOffset: offset,
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
