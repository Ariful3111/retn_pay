import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_field.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_images.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_info.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class RepairRequestDetails extends StatelessWidget {
  const RepairRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: MediaQuery.heightOf(context),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
            children: [
              RepairRequestInfo(),
              SizedBox(height: 24.h),
              CustomTextPrimary(
                text: 'Repair Request Details:',
                fontSize: 20.sp,
                color: AppColors.primaryColorDark,
              ),
              SizedBox(height: 12.h),
              CustomTextSpan(
                title: 'Urgency: ',
                spantext: 'Urgent',
                spanColor: AppColors.primaryColorDark,
                fontSize: 20.sp,
                spanFontSize: 16.sp,
              ),
              SizedBox(height: 16.h),
              repairRequestField(title: 'Issue Title ', subTitle: 'Plumbing issue'),
              SizedBox(height: 16.h),
              repairRequestField(
                title: 'Issue Details',
                subTitle:
                    'A persistent plumbing problem has emerged in the Johnson household. The kitchen sink is draining slowly, causing water to back up and creating a mess. Additionally, the bathroom faucet has developed a constant drip, leading to concerns about water waste and potential damage. The family is frustrated and seeking a reliable plumber to resolve these issues promptly.',
              ),
              SizedBox(height: 16.h),
              RepairRequestImages(),
            ],
          ),
          Positioned(right: 10.w, top: 10.h, child: RepairRequestStatus()),
        ],
      ),
    );
  }

  
}
