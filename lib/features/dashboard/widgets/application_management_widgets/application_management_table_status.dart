import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementTableStatus extends StatelessWidget {
  final String status;
  const ApplicationManagementTableStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color? text;
    Color? bg;
    if (status == "Credit Check Approved") {
      bg = isDark ? AppColors.darkPendingBG : Color(0xFFFFEFDC);
      text = isDark ? AppColors.pendingBG : Color(0xFFFA9B14);
    } else if (status == "Reference Checked") {
      bg = isDark ? AppColors.darkPendingBG : Color(0xFFFFF7E6);
      text = isDark ? AppColors.pendingBG : Color(0xFFFFAE00);
    } else if (status == "Assessed Rental Threshold") {
      bg = isDark ? AppColors.darkApprovedBG : Color(0xFFEBEDF0);
      text = isDark ? AppColors.approveBG : Color(0xFF243757);
    } else if (status == "Rejected") {
      bg = isDark ? AppColors.darkRejectBG : Color(0xFFFAEDE8);
      text = isDark ? AppColors.rejectBG : Color(0xFFD17387);
    }

    return status=='Approved'|| status=='Submitted'?TableStatus(status: status) :Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: bg,
      ),
      child: CustomTextPrimary(
        text: status,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: text,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
