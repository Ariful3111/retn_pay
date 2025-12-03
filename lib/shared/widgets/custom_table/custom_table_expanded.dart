import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class CustomTableExpanded extends StatelessWidget {
  final int rowIndex;
  final Widget status;
  const CustomTableExpanded({super.key, required this.rowIndex, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<InspectionRequestController>();
    return Obx(() {
      if (!controller.expanded[rowIndex]) return SizedBox.shrink();
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPrimary(
                  text: "Property Address: 456 Oak Avenue",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () {
                    controller.toggleExpanded(rowIndex);
                  },
                  child: Container(
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteButtonColor,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Center(
                      child: Image.asset(
                        IconsPath.close,
                        height: 8.25.h,
                        width: 8.25.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextPrimary(
              text: "Monthly Rent: \$450/week",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 8.h),
            CustomTextPrimary(
              text: "Scheduled: 8 Aug, 2025 10:00 AM",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 8.h),
            CustomTextPrimary(
              text: "Inspection Type: AR",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                CustomTextPrimary(
                  text: "Status",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 8.w),
                status,
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
                  height: 36.h,
                  width: 80.w,
                  borderColor: isDark
                      ? AppColors.darkBorderPrimary
                      : AppColors.whiteBorder,
                  color: isDark
                      ? AppColors.darkContainer
                      : AppColors.whiteColor,
                  text: 'Cancel',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkContainer,
                  onPressed: () {},
                ),
                SizedBox(width: 8.w),
                CustomPrimaryButton(
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
                        text: "AR",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkAppBar,
                      ),
                    ],
                  ),
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
        ),
      );
    });
  }
}
