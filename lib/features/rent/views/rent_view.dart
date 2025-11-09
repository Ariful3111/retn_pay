import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/rent/widgets/rent_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class RentView extends StatelessWidget {
  const RentView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          RentAppbar(),
        ],
      ),
    );
  }
}