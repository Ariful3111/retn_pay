import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_request_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/release_form.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class KeyReleaseView extends GetView<GetAgreementsController> {
  const KeyReleaseView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final keyReleaseController = Get.find<KeyReleaseRequestController>();
    keyReleaseController.initSignatureController(isDark);

    return Obx(
      () => CustomContainer(
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground,
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: controller.isLoading.value
            ? Column(
                children: [
                  DrawerItemsAppbar(title: 'Key Release'),
                  const Expanded(child: Center(child: ButtonLoading())),
                ],
              )
            : ListView(
                physics: keyReleaseController.isDrawing.value
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
                      child: ReleaseForm(
                        agreement: controller.firstAgreement,
                        onSubmit: () => keyReleaseController.submitTenant(
                          leaseAgreementId: controller.firstAgreement?.id ?? 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
