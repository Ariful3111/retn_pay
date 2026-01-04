import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/dropdown_input_decoration.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/dropdown_menu_items.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List option;
  final void Function(String? value) onSelect;
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
  final double? menuFontSize;
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
    this.menuFontSize,
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
        inputDecorationTheme: DropdownInputDecoration().inputDecoration(
          context: context,
          fillColor: fillColor,
          enableBorder: enableBorder,
          focusBorder: focusBorder,
          focusBorderWidth: focusBorderWidth,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          focusBorderRadius: focusBorderRadius,
          contentPadding: contentPadding,
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
        dropdownMenuEntries: DropdownMenuItems().dropdownMenuItem(
          option: option,
          isSelect: isSelect,
          context: context,
          menuFontSize: menuFontSize,
        ),
      );
    });
  }
}
