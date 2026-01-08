import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/signature_field.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/signature_mode_button.dart';
import 'package:signature/signature.dart';

class SignatureDraw extends StatelessWidget {
  final RxString signatureMode;
  final RxBool isDrawing;
  final SignatureController signatureController;
  final RxString typedText;
  final TextEditingController textEditingController;

  const SignatureDraw({
    super.key,
    required this.signatureMode,
    required this.isDrawing,
    required this.signatureController,
    required this.typedText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
                if (signatureMode.value == 'draw')
                  Listener(
                    onPointerDown: (event) {
                      isDrawing.value = true;
                    },
                    onPointerCancel: (event) {
                      isDrawing.value = false;
                    },
                    onPointerUp: (event) {
                      isDrawing.value = false;
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(17.r),
                      child: Signature(
                        controller: signatureController,
                        backgroundColor: isDark
                            ? AppColors.darkSecondary
                            : AppColors.whiteColor,
                      ),
                    ),
                  ),
                if (signatureMode.value == 'type')
                  Center(
                    child: Text(
                      typedText.value,
                      style: GoogleFonts.alexBrush(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w500,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkPrimary,
                      ),
                    ),
                  ),
                if (signatureMode.value == 'type')
                  SignatureField(
                    controller: textEditingController,
                    onChanged: (value) {
                      typedText.value = value;
                    },
                    onClear: () {
                      signatureController.clear();
                      textEditingController.clear();
                      typedText.value = '';
                    },
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SignatureModeButton(
          signatureMode: signatureMode,
          onModeChanged: (mode) {
            signatureMode.value = mode;
            signatureController.clear();
            textEditingController.clear();
            typedText.value = '';
          },
        ),
      ],
    );
  }
}
