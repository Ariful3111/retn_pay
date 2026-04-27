import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CheckoutInfo extends StatelessWidget {

  const CheckoutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(title: 'User Name', sub: 'User'),
        text(title: 'User Type', sub: user(userIndex.toString())),
        text(title: 'User Email', sub: 'user@gmailo.com'),
        text(title: 'User Address', sub: 'Dhaka'),
        text(title: 'Current Balance', sub: '\$200'),     
      ],
    );
  }

  Widget text({required title, required sub}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: title, fontSize: 18.sp),
        SizedBox(height: 8.h),
        CustomTextSecondary(text: sub),
        SizedBox(height: 12.h),
      ],
    );
  }

  String user(String user) {
    if (userIndex == 0) {
      user = 'Tenant';
    } else if (userIndex == 1) {
      user = 'Landlord';
    } else if (userIndex == 2) {
      user = 'Agent';
    } else {
      user = 'Service Vendor';
    }
    return user;
  }
}
