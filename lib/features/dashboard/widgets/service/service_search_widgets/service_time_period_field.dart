import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class ServiceTimePeriodField extends StatelessWidget {
  const ServiceTimePeriodField({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 26.h,
      width: 150.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0.64),
            blurRadius: 1.27,
            color: AppColors.dropShadowColorSecondary.withValues(alpha: 0.24),
          ),
        ],
      ),
      child: Center(
        child: CustomTextField(
          controller: serviceSearchController.timeController,
          labelText: 'Other',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          enableBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.64.w,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
            borderRadius: BorderRadius.circular(6.35),
          ),
          focusBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.64.w,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
            borderRadius: BorderRadius.circular(6.35),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.64.w,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
            borderRadius: BorderRadius.circular(6.35),
          ),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          padding: EdgeInsetsGeometry.zero,
        ),
      ),
    );
  }
}
