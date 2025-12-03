import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/landlord_signature.dart';
import 'package:renter_pay/features/dashboard/widgets/room_info.dart';
import 'package:renter_pay/features/dashboard/widgets/signature_draw.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ReleaseForm extends StatelessWidget {
  const ReleaseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: 'Key Release Form', fontSize: 24.sp),
        SizedBox(height: 24.h),
        formText(title: 'Resident First Name:', subTitle: 'Ariful'),
        SizedBox(height: 20.h),
        formText(title: 'Resident Last Name:', subTitle: 'Islam'),
        SizedBox(height: 24.h,),
        infoText(text: 'Property Address:'),
        SizedBox(height: 12.h,),
        formText(title: 'Address Line 1:', subTitle: 'Dhanmondi'),
        SizedBox(height: 20.h,),
        formText(title: 'Address Line 2:', subTitle: 'Kawran-Bazar'),
        SizedBox(height: 20.h,),
        formText(title: 'City:', subTitle: 'Dhaka'),
        SizedBox(height: 20.h,),
        formText(title: 'State:', subTitle: 'Bangla-Motor'),
        SizedBox(height: 20.h,),
        formText(title: 'Zip Code:', subTitle: '400'),
        SizedBox(height: 24.h,),
        RoomInfo(),
        SizedBox(height: 24.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            formText(title: 'Date:', subTitle: '12 October, 2025'),
          ],
        ),
        infoText(text: 'Resident Signature'),
        SizedBox(height: 14.h,),
        SignatureDraw(),
        SizedBox(height: 20.h,),
        infoText(text: 'Landlord/Agent Signature'),
        SizedBox(height: 13.h,),
        LandlordSignature(),
        SizedBox(height:  20.h),
        Center(
          child: CustomPrimaryButton(height: 40.h,width: 100.w, onPressed: () {
            
          },
          text: 'Submit',
          borderRadius: BorderRadius.circular(6.r),
          ),
        )
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

  Widget formText(
    {
      required String title,
      required String subTitle,
    }
  ) {
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
