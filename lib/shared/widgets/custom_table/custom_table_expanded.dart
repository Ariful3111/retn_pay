import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_close_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class CustomTableExpanded extends StatelessWidget {
  final String title;
  final bool isOpen;
  final VoidCallback onExpandedClose;
  final Widget expandedContent;
  const CustomTableExpanded({
    super.key,
    required this.title,
    required this.isOpen,
    required this.onExpandedClose,
    required this.expandedContent,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        isOpen
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomTextPrimary(
                            text: title,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                            softWrap: true,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        CustomCloseButton(
                          onTap: onExpandedClose,
                          color: isDark
                              ? AppColors.darkBorderPrimary
                              : AppColors.whiteButtonColor,
                          height: 36.h,
                          width: 36.h,
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
        Container(
          height: 1,
          decoration: BoxDecoration(
            border: BoxBorder.all(
              width: 1.r,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
          ),
        ),
      ],
    );
  }
}
