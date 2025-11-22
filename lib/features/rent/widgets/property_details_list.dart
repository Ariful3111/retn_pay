import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';

class PropertyDetailsList extends StatelessWidget {
  final String title;
  const PropertyDetailsList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27.h,
      child: Row(
        children: [
          Image.asset(IconsPath.propertyCheck,height: 15.h,width: 15.w,),
          SizedBox(width: 8.w,),
          CustomTextPrimary(text: title,fontSize: 16.sp,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}