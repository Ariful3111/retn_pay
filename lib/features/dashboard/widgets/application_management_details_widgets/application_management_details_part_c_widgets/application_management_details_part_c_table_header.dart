import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartCTableHeader extends StatelessWidget {
  final bool isDark;
  const ApplicationManagementDetailsPartCTableHeader({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: AppColors.darkSecondaryText,
                  ),
                ),
              ),
            ),
          ),
          _headerText('Yes'),
          _headerText('No'),
        ],
      ),
    );
  }

  Widget _headerText(String text) {
    return Expanded(
      child: Center(
        child: CustomTextSecondary(
          text: text,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: isDark
              ? AppColors.whiteColor
              : AppColors.darkTextColor,
        ),
      ),
    );
  }
}
