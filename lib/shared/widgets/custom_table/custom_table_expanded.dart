import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class CustomTableExpanded extends StatelessWidget {
  final int rowIndex;
  final String title;
  final List rowList;
  final bool isOpen;
  final VoidCallback onExpandedClose;
  final Widget expandedContent;
  const CustomTableExpanded({
    super.key,
    required this.rowIndex,
    required this.title,
    required this.rowList,
    required this.isOpen,
    required this.onExpandedClose, required this.expandedContent,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

      if (rowIndex < 0 || rowIndex >= rowList.length) {
        return SizedBox.shrink();
      }
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeOut,
        child: isOpen
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextPrimary(
                          text: title,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        GestureDetector(
                          onTap: onExpandedClose,
                          child: Container(
                            height: 36.h,
                            width: 36.h,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkBorderPrimary
                                  : AppColors.whiteButtonColor,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Center(
                              child: Image.asset(
                                IconsPath.close,
                                height: 8.25.h,
                                width: 8.25.w,
                                color: isDark ? AppColors.darkAppBar : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedOpacity(
                      opacity: isOpen ? 1 : 0,
                      duration: Duration(milliseconds: 200),
                      child: expandedContent,
                    ),
                  ],
                ),
              )
            : SizedBox(),
      );
  }
}
