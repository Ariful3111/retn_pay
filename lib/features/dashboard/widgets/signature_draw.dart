import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/signature_field.dart';
import 'package:renter_pay/features/dashboard/widgets/signature_mode_button.dart';
import 'package:signature/signature.dart';

class SignatureDraw extends StatelessWidget {
  const SignatureDraw({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
                if (keyReleaseController.signatureMode.value == 'draw')
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(17.r),
                    child: Signature(
                      controller: keyReleaseController.signatureController,
                      backgroundColor: isDark
                          ? AppColors.darkSecondary
                          : AppColors.whiteColor,
                    ),
                  ),
                if (keyReleaseController.signatureMode.value == 'type')
                  Center(
                    child: Text(
                      keyReleaseController.typedText.value,
                      style: GoogleFonts.alexBrush(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w500,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkPrimary,
                      ),
                    ),
                  ),
                if (keyReleaseController.signatureMode.value == 'type')
                  SignatureField(),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SignatureModeButton(),
      ],
    );
  }
}
