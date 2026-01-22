import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceVendorAd extends StatelessWidget {
  const ServiceVendorAd({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceVendorDashboardController serviceVendorDashboardController =
        Get.find();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Ad booster warning',
            fontSize: 24.sp,
            color: AppColors.primaryColorDark,
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.whiteBorder),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              border: Border.all(width: 1.w, color: AppColors.whiteBorder),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 28,
                  color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      IconsPath.checkCircle,
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(width: 8.w),
                    CustomTextSecondary(text: 'Option to buy ad boosters:'),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 52.w),
                  child: Column(
                    children: List.generate(
                      serviceVendorDashboardController.adList.length,
                      (index) {
                        return Obx(
                          () => Row(
                            children: [
                              CustomCheckBox(
                                borderColor: AppColors.primaryColorDark,
                                isChecked:
                                    serviceVendorDashboardController
                                        .adIndex
                                        .value ==
                                    index,
                                onChange: (value) {
                                  serviceVendorDashboardController
                                          .adIndex
                                          .value =
                                      index;
                                },
                              ),
                              CustomTextSecondary(text: serviceVendorDashboardController.adList[index])
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
