import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionActionButton extends GetWidget<InspectionRequestController> {
  final int id;
  const InspectionActionButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final item = controller.inspections.value!.data!.firstWhere(
      (element) => element.id == id,
    );
    return Row(
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
          textColor: isDark ? AppColors.whiteColor : AppColors.darkContainer,
          onPressed: () {},
        ),
        SizedBox(width: 8.w),
        if (item.status?.capitalizeFirst != 'Rejected' &&
            item.status?.capitalizeFirst != 'Cancel' &&
            item.status?.capitalizeFirst != 'Pending' &&
            item.type?.capitalizeFirst == 'Virtual')
          Padding(
            padding: EdgeInsetsGeometry.only(right: 8.w),
            child: vRButton(),
          ),

        if (item.status?.capitalizeFirst == 'Completed')
          CustomPrimaryButton(
            borderRadius: BorderRadius.circular(6.r),
            height: 36.h,
            width: 80.w,
            backgroundColor: LinearGradient(
              colors: [AppColors.tableUpload, AppColors.tableUpload],
            ),
            text: 'Apply',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColors.whiteColor,
            onPressed: () {},
          ),
      ],
    );
  }

  vRButton() {
    return CustomPrimaryButton(
      borderRadius: BorderRadius.circular(6.r),
      height: 36.h,
      width: 80.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsPath.tableInspection, height: 18.h, width: 18.w),
          CustomTextPrimary(
            text: "VR",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.darkAppBar,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
