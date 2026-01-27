import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class FilterSearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  const FilterSearchField({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 41.42.h,
      width: 223.19.w,
      child: Material(
        color: Colors.transparent,
        child: CustomTextField(
          padding: EdgeInsets.zero,
          controller: textEditingController,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Image.asset(
              IconsPath.homeSearch,
              height: 18.41.h,
              width: 18.41.w,
              color: isDark ? AppColors.darkAppBar : null,
            ),
          ),
          textColor: isDark ? AppColors.darkAppBar : null,
          labelText: 'Search Address',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isFilled: true,
          maxLines: 1,
          enableBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.54.sp),
            borderSide: BorderSide(
              color: isDark
                  ? AppColors.secondaryTextColor
                  : AppColors.filterBorder,
            ),
          ),
          focusBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.54.sp),
            borderSide: BorderSide(
              color: isDark
                  ? AppColors.secondaryTextColor
                  : AppColors.filterBorder,
            ),
          ),
          fillColor: isDark ? AppColors.darkBorderPrimary : AppColors.tableHead,
        ),
      ),
    );
  }
}
