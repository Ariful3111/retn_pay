import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:signature/signature.dart';

class SignatureDraw extends StatelessWidget {
  const SignatureDraw({super.key});

  @override
  Widget build(BuildContext context) {
    KeyReleaseController keyReleaseController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 212.h,
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            border: Border.all(width: 0.85.r, color: AppColors.secondaryBorder),
            borderRadius: BorderRadius.circular(17.03.r),
          ),
          child: Obx(
            () => Stack(
              children: [
                Signature(
                  controller: keyReleaseController.signatureController,
                  backgroundColor: AppColors.whiteColor,
                ),
                keyReleaseController.signatureMode.value == 'draw'
                    ? SizedBox()
                    : Positioned(
                        left: 17.w,
                        top: 137.h,
                        child: SizedBox(
                          height: 29.81.h,
                          width: MediaQuery.widthOf(context),
                          child: TextFormField(
                            controller: keyReleaseController.drawController,
                            decoration: InputDecoration(
                              prefix: Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: GestureDetector(
                                  onTap: () {
                                    keyReleaseController.signatureController
                                        .clear();
                                    keyReleaseController.drawController.clear();
                                  },
                                  child: Image.asset(
                                    IconsPath.close,
                                    height: 12.h,
                                    width: 12.w,
                                    color: Color(0xFF251621),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 52.h,
          width: 153.w,
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: AppColors.userBackground,
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                drawButton(text: 'Draw', mode: 'draw'),
                drawButton(text: 'Type', mode: 'type'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget drawButton({required String text, required String mode}) {
    KeyReleaseController keyReleaseController = Get.find();
    return GestureDetector(
      onTap: () {
        keyReleaseController.signatureMode.value = mode;
        keyReleaseController.signatureController.clear();
        keyReleaseController.drawController.clear();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.52.h, horizontal: 13.63.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.81.r),
          color: keyReleaseController.signatureMode.value == mode
              ? AppColors.primaryColorDark
              : null,
        ),
        child: CustomTextSecondary(
          text: text,
          color: keyReleaseController.signatureMode.value == mode
              ? AppColors.whiteColor
              : null,
        ),
      ),
    );
  }
}
