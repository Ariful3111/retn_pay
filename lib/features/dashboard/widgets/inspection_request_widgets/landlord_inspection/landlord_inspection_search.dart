import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class LandlordInspectionSearch extends GetWidget<InspectionRequestController> {
  const LandlordInspectionSearch({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 48.h,
      child: CustomTextField(
        controller: controller.searchController,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Image.asset(IconsPath.homeSearch, height: 24.h, width: 24.w),
        ),
        focusBorderWidth: 1.r,
        borderWidth: 1.r,
        enableBorderWidth: 1.r,
        labelText: 'Search',
        fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
