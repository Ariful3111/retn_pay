import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/add_repair_request_widgets/landlord_signature.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/landlord_key_release_room_info.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/signature_draw.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:signature/signature.dart';

class LandlordReleaseForm extends StatelessWidget {
  final RxString signatureMode;
  final RxBool isDrawing;
  final SignatureController signatureController;
  final RxString typedText;
  final TextEditingController textEditingController;
  const LandlordReleaseForm({
    super.key,
    required this.signatureMode,
    required this.isDrawing,
    required this.signatureController,
    required this.typedText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CustomTextPrimary(text: 'Key Release Form', fontSize: 24.sp),
        ),
        SizedBox(height: 24.h),
        customField(
          controller: TextEditingController(),
          labelText: "Resident First Name*",
          context: context,
        ),
        SizedBox(height: 20.h),
        customField(
          controller: TextEditingController(),
          labelText: "Resident Last Name*",
          context: context,
        ),
        SizedBox(height: 24.h),
        infoText(text: 'Property Address:'),
        SizedBox(height: 12.h),
        customField(
          controller: TextEditingController(),
          labelText: "Address Line 1*",
          context: context,
        ),
        SizedBox(height: 20.h),
        customField(
          controller: TextEditingController(),
          labelText: "Address Line 2*",
          context: context,
        ),
        SizedBox(height: 20.h),
        customField(
          controller: TextEditingController(),
          labelText: "City*",
          context: context,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          label: CustomTextSecondary(text: "State*"),
          option: ['Bangladesh', 'USA', 'Canada', "Australia"],
          onSelect: (value) {},
          isSelect: RxString(''),
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkPrimary
              : AppColors.whiteColor,
          alignmentGeometry: Alignment(0.10, 0),
        ),
        SizedBox(height: 20.h),
        customField(
          controller: TextEditingController(),
          labelText: "Zip Code*",
          context: context,
        ),
        SizedBox(height: 24.h),
        LandlordKeyReleaseRoomInfo(),
        SizedBox(height: 16.h),
        addMoreButton(),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [formText(title: 'Date:', subTitle: '12 October, 2025')],
        ),
        infoText(text: 'Resident Signature'),
        SizedBox(height: 14.h),
        LandlordSignature(),
        SizedBox(height: 20.h),
        infoText(text: 'Landlord/Agent Signature'),
        SizedBox(height: 13.h),
        SignatureDraw(
          signatureMode: signatureMode,
          isDrawing: isDrawing,
          signatureController: signatureController,
          typedText: typedText,
          textEditingController: textEditingController,
        ),
      ],
    );
  }

  Widget infoText({required String text}) {
    return CustomTextPrimary(
      text: text,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  Widget formText({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: title),
        SizedBox(height: 4.h),
        infoText(text: subTitle),
      ],
    );
  }

  Widget customField({
    required String labelText,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    return CustomTextField(
      controller: controller,
      labelText: labelText,
      fillColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkPrimary
          : AppColors.whiteColor,
    );
  }

  Widget addMoreButton() {
    return CustomSecondaryButton(
      height: 40.h,
      width: 133.w,
      borderRadius: BorderRadius.circular(6.r),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 24.sp, color: AppColors.primaryColorDark),
          SizedBox(width: 4.w),
          CustomTextSecondary(
            text: 'Add More',
            color: AppColors.primaryColorDark,
          ),
        ],
      ),
    );
  }
}
