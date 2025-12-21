import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairRequestStatus extends StatelessWidget {
  const RepairRequestStatus({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return IgnorePointer(
      child: Container(
        padding: EdgeInsets.all(8.r),
        height: 40.h,
        width: 158.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 28,
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextPrimary(
              text: 'Status:',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            TableStatus(status: 'Pending'),
          ],
        ),
      ),
    );
  }
  
}
