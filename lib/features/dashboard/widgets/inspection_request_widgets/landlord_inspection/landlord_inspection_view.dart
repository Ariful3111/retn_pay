import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/inspection_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_profile_info.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_button.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_container.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_details.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_id.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordInspectionView extends GetView<InspectionDetailsController> {
  const LandlordInspectionView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        gradient: isDark ? null : AppColors.userBackground,
        padding: EdgeInsets.all(20.r),
        child: controller.isLoading.value
            ? ButtonLoading()
            : ListView(
                children: [
                  Row(
                    children: [
                      CustomAppbarLeading(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8.w),
                      CustomAppbar(title: 'View Inspection'),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  LandlordInspectionViewContainer(
                    child: Center(
                      child: CustomTextPrimary(
                        text: 'Inspection Request',
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  LandlordInspectionProfileInfo(),
                  SizedBox(height: 20.h),
                  LandlordInspectionViewId(),
                  SizedBox(height: 20.h),
                  LandlordInspectionViewDetails(),
                  SizedBox(height: 20.h),
                  LandlordInspectionViewButton(),
                  SizedBox(height: 20.h),
                ],
              ),
      );
    });
  }
}
