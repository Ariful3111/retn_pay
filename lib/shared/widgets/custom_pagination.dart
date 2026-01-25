import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomPagination extends StatelessWidget {
  final VoidCallback onTapPrev;
  final VoidCallback onTapNext;
  final Function(dynamic item) onTapPage;
  final int value;
  final List list;
  const CustomPagination({
    super.key,
    required this.list,
    required this.onTapPrev,
    required this.onTapNext,
    required this.onTapPage,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pageButton(
          width: 96.88.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                IconsPath.arrowLeft,
                height: 15.31.h,
                width: 15.31.w,
                color: isDark ? AppColors.whiteColor : null,
              ),
              SizedBox(width: 6.12.w),
              CustomTextPrimary(
                text: 'Previous',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.whiteColor : null,
              ),
            ],
          ),
          onTap: onTapPrev,
          context: context,
        ),
        ...list.map((item) {
          if (item == '...') {
            return Container(
              height: 30.61.h,
              width: 30.61.w,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkContainer
                    : AppColors.textFieldColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: CustomTextSecondary(
                  text: '...',
                  fontSize: 12.52.sp,
                  color: isDark
                      ? AppColors.whiteColor.withValues(alpha: 0.5)
                      : AppColors.primaryDarkTextColor.withValues(alpha: 0.5),
                ),
              ),
            );
          }
          bool isSelect = value == item;
          return GestureDetector(
            onTap: () => onTapPage(item),
            child: Container(
              height: 30.61.h,
              width: 30.61.w,
              decoration: BoxDecoration(
                color: isSelect
                    ? AppColors.primaryColorDark
                    : isDark
                    ? AppColors.darkContainer
                    : AppColors.textFieldColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: CustomTextSecondary(
                  text: '$item',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isSelect
                      ? isDark
                            ? AppColors.whiteColor.withValues(alpha: 0.5)
                            : AppColors.whiteColor
                      : isDark
                      ? AppColors.whiteColor.withValues(alpha: 0.5)
                      : AppColors.primaryDarkTextColor.withValues(alpha: 0.5),
                ),
              ),
            ),
          );
        }),
        pageButton(
          width: 73.86.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextPrimary(
                text: 'Next',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.whiteColor : null,
              ),
              SizedBox(width: 6.12.w),
              Image.asset(
                IconsPath.arrowRight,
                height: 15.31.h,
                width: 15.31.w,
                color: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
              ),
            ],
          ),
          onTap: onTapNext,
          context: context,
        ),
      ],
    );
  }

  Widget pageButton({
    required VoidCallback onTap,
    required BuildContext context,
    double? width,
    Widget? child,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33.25.h,
        width: width,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.12.sp),
          border: Border.all(
            width: 0.77.sp,
            color: isDark
                ? AppColors.whiteColor.withValues(alpha: 0.10)
                : AppColors.darkPrimary.withValues(alpha: 0.10),
          ),
        ),
        child: child,
      ),
    );
  }
}
