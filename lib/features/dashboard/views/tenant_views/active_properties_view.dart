import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/active_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/rent_notice_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_image.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_widgets.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_rent_notice.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_animation/custom_animated_switcher.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_animation/custom_shadow_overlay_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';
import 'package:renter_pay/shared/widgets/property/property_details_info.dart';

class ActivePropertiesView extends StatefulWidget {
  const ActivePropertiesView({super.key});

  @override
  State<ActivePropertiesView> createState() => _ActivePropertiesViewState();
}

class _ActivePropertiesViewState extends State<ActivePropertiesView> {
  ActivePropertyController activePropertyController = Get.find();
  RentNoticeController rentNoticeController = Get.find();
  LeaseAgreementController leaseAgreementController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      leaseAgreementController.getLeaseAgreements();
      rentNoticeController.getRentNotices();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.all(20.r),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground,
        child: leaseAgreementController.isLoading.value
            ? ButtonLoading()
            : ListView(
                physics: activePropertyController.isAccess.value
                    ? AlwaysScrollableScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                children: [
                  DrawerItemsAppbar(title: 'Active Properties'),
                  CustomAnimatedSwitcher(
                    child: Stack(
                      key: ValueKey(activePropertyController.isAccess.value),
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20.h),
                            ActivePropertyImage(
                              images:
                                  activePropertyController
                                      .activePropertyDetails
                                      .value
                                      ?.data
                                      ?.images ??
                                  const [],
                            ),
                            SizedBox(height: 20.h),
                            PropertyDetailsInfo(
                              propertyDetails: activePropertyController
                                  .toPropertyDetailsModel(
                                    (leaseAgreementController
                                                .leaseAgreements
                                                .value
                                                ?.data
                                                ?.data
                                                ?.isNotEmpty ??
                                            false)
                                        ? leaseAgreementController
                                              .leaseAgreements
                                              .value!
                                              .data!
                                              .data!
                                              .first
                                        : null,
                                  ),
                            ),
                            SizedBox(height: 20.h),
                            DashboardRentNotice(),
                            SizedBox(height: 20.h),
                            ActivePropertyWidgets(),
                          ],
                        ),
                        if (!activePropertyController.isAccess.value)
                          CustomShadowOverlayButton().shadow(
                            context: context,
                            imageFilter: ImageFilter.blur(
                              sigmaX: 1.5,
                              sigmaY: 1.5,
                            ),
                          ),
                        if (!activePropertyController.isAccess.value)
                          Positioned(
                            top: 370.h,
                            left: 20.w,
                            right: 20.w,
                            child: CustomPrimaryButton(
                              onPressed: () {
                                activePropertyController.isAccess.value =
                                    !activePropertyController.isAccess.value;
                              },
                              height: 48.h,
                              width: 307.w,
                              text: 'Agreement',
                            ),
                          ),
                        if (!activePropertyController.isAccess.value)
                          Positioned(
                            top: 430.h,
                            left: 20.w,
                            right: 20.w,
                            child: CustomPrimaryButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.keyReleaseView);
                              },
                              height: 48.h,
                              width: 307.w,
                              text: 'Key Release Form',
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
