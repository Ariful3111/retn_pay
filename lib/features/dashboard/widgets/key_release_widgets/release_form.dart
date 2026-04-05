import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/key_release_controller.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/get_agreements_model.dart';
import 'package:renter_pay/features/dashboard/widgets/add_repair_request_widgets/landlord_signature.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/room_info.dart';
import 'package:renter_pay/features/dashboard/widgets/key_release_widgets/landlord_key_release/signature_draw.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:signature/signature.dart';

class ReleaseForm extends StatelessWidget {
  final SignatureController signatureController;
  final AgreementItem? agreement;
  const ReleaseForm({
    super.key,
    required this.signatureController,
    this.agreement,
  });

  @override
  Widget build(BuildContext context) {
    KeyReleaseController keyReleaseController = Get.find();

    // Dynamic data from API or static fallbacks
    final firstName = agreement?.tenant?.firstName ?? 'Ariful';
    final lastName = agreement?.tenant?.lastName ?? 'Islam';
    final address = agreement?.property?.address ?? 'Dhanmondi';
    final city = agreement?.property?.city ?? 'Dhaka';
    final state = agreement?.property?.state ?? 'Bangla-Motor';
    final zipCode = agreement?.property?.postalCode ?? '400';
    final roomName =
        agreement?.propertyUnit?.unitName ??
        agreement?.propertyUnit?.unitNumber ??
        'SKS Tower';
    final currentDate = _getCurrentDate();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: 'Key Release Form', fontSize: 24.sp),
        SizedBox(height: 24.h),
        formText(title: 'Resident First Name:', subTitle: firstName),
        SizedBox(height: 20.h),
        formText(title: 'Resident Last Name:', subTitle: lastName),
        SizedBox(height: 24.h),
        infoText(text: 'Property Address:'),
        SizedBox(height: 12.h),
        formText(title: 'Address Line 1:', subTitle: address),
        SizedBox(height: 20.h),
        formText(title: 'Address Line 2:', subTitle: ''),
        SizedBox(height: 20.h),
        formText(title: 'City:', subTitle: city),
        SizedBox(height: 20.h),
        formText(title: 'State:', subTitle: state),
        SizedBox(height: 20.h),
        formText(title: 'Zip Code:', subTitle: zipCode),
        SizedBox(height: 24.h),
        RoomInfo(roomName: roomName, date: currentDate),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [formText(title: 'Date:', subTitle: currentDate)],
        ),
        infoText(text: 'Resident Signature'),
        SizedBox(height: 14.h),
        userIndex == 2
            ? LandlordSignature()
            : SignatureDraw(
                signatureMode: keyReleaseController.signatureMode,
                isDrawing: keyReleaseController.isDrawing,
                signatureController: signatureController,
                typedText: keyReleaseController.typedText,
                textEditingController: keyReleaseController.drawController,
              ),
        SizedBox(height: 20.h),
        infoText(text: 'Landlord/Agent Signature'),
        SizedBox(height: 13.h),
        LandlordSignature(),
        SizedBox(height: 20.h),
        Center(
          child: CustomPrimaryButton(
            height: 40.h,
            width: 100.w,
            onPressed: () {},
            text: 'Submit',
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ],
    );
  }

  // Helper method to format current date
  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${now.day} ${months[now.month - 1]}, ${now.year}';
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
}
