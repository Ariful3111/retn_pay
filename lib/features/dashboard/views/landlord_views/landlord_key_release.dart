import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_key_release_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/landlord_release_form.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class LandlordKeyRelease extends StatelessWidget {
  const LandlordKeyRelease({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    LandlordKeyReleaseController keyReleaseController = Get.find();
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Obx(
        () => ListView(
          physics: keyReleaseController.isDrawing.value
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
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
                child: LandlordReleaseForm(
                  signatureMode: keyReleaseController.signatureMode,
                  isDrawing: keyReleaseController.isDrawing,
                  signatureController: keyReleaseController.signatureController,
                  typedText: keyReleaseController.typedText,
                  textEditingController: keyReleaseController.drawController,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: CustomPrimaryButton(
                height: 40.h,
                width: 100.w,
                onPressed: () {},
                text: 'Submit',
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
