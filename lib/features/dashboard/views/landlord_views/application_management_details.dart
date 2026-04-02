import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_header.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_widgets.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ApplicationManagementDetails
    extends GetView<ApplicationManagementDetailsController> {
  const ApplicationManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        gradient: isDark ? null : AppColors.userBackground,
        child: controller.isLoading.value
            ? ButtonLoading()
            : ListView(
                children: [
                  Row(
                    children: [
                      CustomAppbarLeading(onTap: () => Navigator.pop(context)),
                      SizedBox(width: 8.w),
                      CustomAppbar(title: 'Applications'),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ApplicationManagementDetailsHeader(),
                  SizedBox(height: 20.h),
                  ApplicationManagementDetailsWidgets(),
                ],
              ),
      );
    });
  }
}
