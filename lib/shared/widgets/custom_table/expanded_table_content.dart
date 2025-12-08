import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ExpandedTableContent extends StatelessWidget {
  final int rowIndex;
  const ExpandedTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<InspectionRequestController>();
    final item = controller.allRows[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text: "Monthly Rent: ${item.rent}",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text: "Scheduled: ${item.scheduleDate}",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text: "Inspection Type: ${item.type}",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            CustomTextPrimary(
              text: "Status",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(width: 8.w),
            TableStatus(status: item.status),
          ],
        ),
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text: "Action",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSecondaryButton(
              borderRadius: BorderRadius.circular(6.r),
              height: 36.h,
              width: 80.w,
              borderColor: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.whiteBorder,
              color: isDark ? AppColors.darkContainer : AppColors.whiteColor,
              text: 'Cancel',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: isDark
                  ? AppColors.whiteColor
                  : AppColors.darkContainer,
              onPressed: () {},
            ),
            SizedBox(width: 8.w),
            if(item.type == 'VR'&& item.status !='Complete' )  CustomPrimaryButton(
              borderRadius: BorderRadius.circular(6.r),
              height: 36.h,
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset(
                    IconsPath.tableInspection,
                    height: 18.h,
                    width: 18.w,
                  ),
                  CustomTextPrimary(
                    text: item.type,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkAppBar,
                  ),
                ],
              ),
              onPressed: () {},
            ),
            if(item.status == 'Complete') CustomSecondaryButton(
              borderRadius: BorderRadius.circular(6.r),
              height: 36.h,
              width: 80.w,
              color:  AppColors.tableUpload,
              text: 'Apply',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: isDark
                  ? AppColors.whiteColor
                  : AppColors.darkContainer,
              onPressed: () {},
            ),

          ],
        ),
        SizedBox(height: 12.h),
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
