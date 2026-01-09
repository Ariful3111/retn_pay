import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/inspection_from_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionAgreement extends StatelessWidget {
  const InspectionAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionFromController inspectionFromController = Get.find();
    return Row(
      children: [
        Obx((){
          return Checkbox(
          visualDensity: VisualDensity.compact,
          activeColor: AppColors.primaryColorDark,
          side: BorderSide(color: Color(0xFF697483)),
          value: inspectionFromController.isAgree.value,
          onChanged: (value) {
            inspectionFromController.isAgree.value = value??true;
          },
        );
        }),
        CustomTextSecondary(text: 'I agree to the Terms & Privacy Policy',fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xFF6F6F6F),),
      ],
    );
  }
}
