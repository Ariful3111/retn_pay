import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/features/rent/widgets/inspection_verification_document.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';

class InspectionVerification extends StatelessWidget {
  const InspectionVerification({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyViewController propertyViewController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(21.56.r),
      height: 666.h,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.78.r),
        color:isDark? AppColors.darkPrimary:AppColors.whiteColor,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InspectionVerificationDocument(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSecondaryButton(
                    text: 'Back',
                    height: 44.h,
                    width: 85.w,
                    borderRadius: BorderRadius.circular(6.57.r),
                    borderWidth: 0.82,
                    onPressed: () {
                     Navigator.pop(context);
                      propertyViewController.frontImage.value = null;
                      propertyViewController.backImage.value = null;
                    },
                  ),
                  SizedBox(width: 15.w),
                  CustomPrimaryButton(
                    borderRadius: BorderRadius.circular(6.57.r),
                    height: 44.h,
                    width: 85.w,
                    text: 'Upload',
                    onPressed: () {
                      if (propertyViewController.frontImage.value == null) {
                        Get.toNamed(AppRoutes.inspectionFrom);
                      } else {
                        Get.toNamed(AppRoutes.inspectionFrom);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
