import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/customer_review.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyCustomerReview extends StatelessWidget {
  const PropertyCustomerReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextPrimary(text: 'Customer Review',fontSize: 20.sp,color: Color(0xFF251621),),
        CustomTextPrimary(text: 'Hear what our happy tenants say about Maple',fontSize: 14.sp,color: Color(0xFF7A8699),fontWeight: FontWeight.w400,),
        CustomTextPrimary(text: 'Grove Garden House',fontSize: 14.sp,color: Color(0xFF7A8699),fontWeight: FontWeight.w400,),
        SizedBox(height: 12.h,),
        CustomerReview(),
      ],
    );
  }
}