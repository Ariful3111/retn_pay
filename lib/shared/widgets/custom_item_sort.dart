import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomItemSort extends StatelessWidget {
  final String title;
  final List option;
  final void Function(String?) onSelect;
  final RxString isSelect;
  const CustomItemSort({
    super.key,
    required this.title,
    required this.option,
    required this.onSelect,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(5.93.sp),
      height: 56.72.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.74,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.filterBorder,
        ),
        borderRadius: BorderRadius.circular(8.89.sp),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextPrimary(text: title, fontSize: 16.sp),
              CustomTextSecondary(
                text: '---  Showing  result- (12)',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF697483),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: CustomDropdownMenu(
              onSelect: onSelect,
              option: option,
              isSelect: isSelect,
              trailingIconHeight: 15.h,
              trailingIconWidth: 10.w,
              selectedTrailingIconHeight: 15.h,
              selectedTrailingIconWidth: 10.w,
              textAlign: TextAlign.start,
              label: CustomTextPrimary(
                text: 'Sort By',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: isDark
                  ? AppColors.darkSecondary
                  : AppColors.whiteButtonColor,
              trailingIconColor: isDark
                  ? AppColors.darkAppBar
                  : AppColors.darkPrimary,
              selectedTrailingIconColor: isDark
                  ? AppColors.darkAppBar
                  : AppColors.darkPrimary,
              contentPadding: EdgeInsets.zero,
              expandedInsets: EdgeInsets.zero,
              textStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? AppColors.darkPrimaryText
                    : AppColors.primaryDarkTextColor,
              ),
              enableBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.93.r),
                borderSide: BorderSide.none,
              ),
              focusBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.93.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
