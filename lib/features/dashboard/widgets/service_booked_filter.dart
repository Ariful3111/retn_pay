import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';

class ServiceBookedFilter extends StatelessWidget {
  const ServiceBookedFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.centerRight,
          child: SizedBox(width: 71.w,
            child: CustomFilterAppbar(onTap: () {
              
            },),
          ),
        );
  }
}