import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_repair_request_widgets/landlord_signature.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/landlord_key_release_room_info.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/signature_draw.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordReleaseForm extends StatelessWidget {
  const LandlordReleaseForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KeyReleaseRequestController>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CustomTextPrimary(text: 'Key Release Form', fontSize: 24.sp),
        ),
        SizedBox(height: 24.h),
        CustomTextField(
          controller: controller.firstNameController,
          labelText: "Resident First Name*",
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          controller: controller.lastNameController,
          labelText: "Resident Last Name*",
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 24.h),
        infoText(text: 'Property Address:'),
        SizedBox(height: 12.h),
        CustomTextField(
          controller: controller.addressLine1Controller,
          labelText: "Address Line 1*",
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          controller: controller.addressLine2Controller,
          labelText: "Address Line 2*",
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          controller: controller.cityController,
          labelText: "City*",
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          label: CustomTextSecondary(text: "State*"),
          option: ['Bangladesh', 'USA', 'Canada', "Australia"],
          onSelect: (value) => controller.selectedState.value = value ?? '',
          isSelect: controller.selectedState,
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          alignmentGeometry: const Alignment(0.2, 1),
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          controller: controller.zipCodeController,
          labelText: "Zip Code*",
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 24.h),
        const LandlordKeyReleaseRoomInfo(),
        SizedBox(height: 16.h),
        addMoreButton(),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [formText(title: 'Date:', subTitle: '12 October, 2025')],
        ),
        infoText(text: 'Resident Signature'),
        SizedBox(height: 14.h),
        const LandlordSignature(),
        SizedBox(height: 20.h),
        infoText(text: 'Landlord/Agent Signature'),
        SizedBox(height: 13.h),
        SignatureDraw(
          signatureMode: controller.signatureMode,
          isDrawing: controller.isDrawing,
          signatureController: controller.signatureController!,
          typedText: controller.typedText,
          textEditingController: controller.drawController,
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
