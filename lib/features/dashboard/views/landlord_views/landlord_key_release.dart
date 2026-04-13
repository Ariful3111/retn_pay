import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/landlord_release_form.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordKeyRelease extends StatelessWidget {
  final int? leaseAgreementId;
  const LandlordKeyRelease({super.key, this.leaseAgreementId});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<KeyReleaseRequestController>();
    controller.initSignatureController(isDark);
    if (controller.items.isEmpty) controller.addItem();

    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Obx(
        () => ListView(
          physics: controller.isDrawing.value
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          children: [
            DrawerItemsAppbar(title: 'Key Release'),
            SizedBox(height: 32.h),
            MediaQuery(
              data: MediaQueryData(
                size: Size(
                  MediaQuery.widthOf(context),
                  MediaQuery.heightOf(context),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSecondary
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const LandlordReleaseForm(),
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: Obx(
                () => CustomPrimaryButton(
                  height: 40.h,
                  width: 100.w,
                  onPressed: controller.isLoading.value
                      ? () {}
                      : () => controller.submitLandlord(
                          leaseAgreementId: leaseAgreementId ?? 0,
                        ),
                  text: controller.isLoading.value ? '' : 'Submit',
                  borderRadius: BorderRadius.circular(6.r),
                  child: controller.isLoading.value
                      ? const ButtonLoading()
                      : null,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
