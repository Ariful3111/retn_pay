import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordInspectionViewDetails extends StatelessWidget {
  const LandlordInspectionViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return LandlordInspectionViewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: 'Personal Details',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 12.h,),
          formText(title: 'Full Name:', subTitle: 'Ariful Islam'),
          SizedBox(height: 12.h,),
          formText(title: 'Email Address:', subTitle: 'arif@gmail.com'),
          SizedBox(height: 12.h,),
          formText(title: 'Phone:', subTitle: '015564564'),
          SizedBox(height: 12.h,),
          formText(title: 'Property Name:', subTitle: 'WiZtech'),
          SizedBox(height: 12.h,),
          formText(title: 'Property Address:', subTitle: 'Dhaka'),
          SizedBox(height: 12.h,),
          formText(title: 'Schedule Date:', subTitle: '8 Aug, 2025'),
          SizedBox(height: 12.h,),
          formText(title: 'Schedule Time:', subTitle: '10'),
          SizedBox(height: 12.h,),
          formText(title: 'Inspection Type:', subTitle: 'In-Person'),
        ],
      ),
    );
  }

  Widget formText({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: title, color: AppColors.darkLightText),
        SizedBox(height: 4.h),
      CustomTextPrimary(
      text: subTitle,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
      ],
    );
  }
}
