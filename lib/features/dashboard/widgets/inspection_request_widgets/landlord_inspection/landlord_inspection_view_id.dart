import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordInspectionViewId extends StatelessWidget {
  const LandlordInspectionViewId({super.key});

  @override
  Widget build(BuildContext context) {
    return LandlordInspectionViewContainer(child: Column(
      children: [
        CustomTextSecondary(
            text: 'ID/Passport/Driving License Details',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.h,),
          Container(height: 443.h,width: 320.w,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(image: AssetImage(ImagesPath.document),fit: BoxFit.fill)
          ),)
      ],
    ),);
  }
}