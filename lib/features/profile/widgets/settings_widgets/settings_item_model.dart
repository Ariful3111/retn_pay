import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SettingsItemModel extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isOn;
  final ValueChanged<bool> onChanged;
  const SettingsItemModel({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text: title,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.primaryDarkTextColor,
              ),
              CustomTextSecondary(
                text: subTitle,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.darkSecondaryText
                    : AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
        CustomSwitchButton(isOn: isOn, onChanged: onChanged),
      ],
    );
  }
}
