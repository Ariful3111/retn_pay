import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';

class CheckoutHeader extends StatelessWidget {
  final String title;
  const CheckoutHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAppbarLeading(onTap: () => Navigator.pop(context)),
        SizedBox(width: 8.w,),
        CustomAppbar(title: title),
      ],
    );
  }
}
