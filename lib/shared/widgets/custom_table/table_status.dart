import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class TableStatus extends StatelessWidget {
  final String status;
  const TableStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color ?text;
    Color ?bg;
    if (status == "Approved"||status == 'Assigned'||status == 'Open') {
      bg = isDark ? AppColors.darkApprovedBG : AppColors.approveBG;
      text = isDark ? AppColors.approveBG : AppColors.approveText;
    } else if (status == "Pending") {
      bg = isDark ? AppColors.darkPendingBG : AppColors.pendingBG;
      text = isDark ? AppColors.pendingBG : AppColors.pendingText;
    } else if (status == "Complete"|| status=='Booked'||status =='Resolved'||status=='Publish') {
      bg = isDark ? AppColors.darkCompleteBG : AppColors.completeBG;
      text = isDark ? AppColors.completeBG : AppColors.completeText;
    }
     else if(status == 'Rejected'){
      bg = isDark ? AppColors.darkRejectBG : AppColors.rejectBG;
      text = isDark ? AppColors.rejectBG : AppColors.rejectText;
    }

    return Container(
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
