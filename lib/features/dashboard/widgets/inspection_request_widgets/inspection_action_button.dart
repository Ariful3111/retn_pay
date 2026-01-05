import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionActionButton extends StatelessWidget {
  final int rowIndex;
  const InspectionActionButton({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<InspectionRequestController>();
    final item = controller.allRows[rowIndex];
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
        if (item.status != 'Complete' &&
            item.status != 'Rejected' &&
            item.status != 'Cancel' &&
            item.status !='Pending'&&
            item.type == 'VR')
          vRButton(text: item.type),
        //if (item.type == 'VR') vRButton(text: item.type),
        if (item.status == 'Complete')
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

  vRButton({required String text}) {
    return CustomPrimaryButton(
      borderRadius: BorderRadius.circular(6.r),
      height: 36.h,
      width: 80.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsPath.tableInspection, height: 18.h, width: 18.w),
          CustomTextPrimary(
            text: text,
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
