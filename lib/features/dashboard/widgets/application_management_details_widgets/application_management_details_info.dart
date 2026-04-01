import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsInfo extends StatelessWidget {
  const ApplicationManagementDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text:
              'For further information, visit the renting section – Consumer Affairs Victoria website at www.consumer.vic.gov.au/renting or call the Consumer Affairs Victoria Helpline on 1300 55 81 81.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
      ],
    );
  }
}
