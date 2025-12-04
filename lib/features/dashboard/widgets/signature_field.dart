import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class SignatureField extends StatelessWidget {
  const SignatureField({super.key});

  @override
  Widget build(BuildContext context) {
    KeyReleaseController keyReleaseController = Get.find();
    return Positioned(
      left: 17.w,
      top: 137.h,
      right: 17.h,
      child: SizedBox(
        height: 80.h,
        width: MediaQuery.widthOf(context),
        child: CustomTextField(
          controller: keyReleaseController.drawController,
          onChanged: (value) {
            keyReleaseController.typedText.value = value;
          },
          labelText: 'Type Your Signature Here',
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: GestureDetector(
              onTap: () {
                keyReleaseController.signatureController.clear();
                keyReleaseController.drawController.clear();
                keyReleaseController.typedText.value = '';
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
    );
  }
}
