import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/rent/widgets/rent_filter.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_end_appbar.dart';

class RentAppBar extends StatelessWidget {
  const RentAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        CustomAppbarLeading(onTap: () {
          
        },),
        SizedBox(width: 10.w,),
        CustomAppbar(title: 'Property'),
        Spacer(),
        CustomEndAppbar(onTap: () {
          showDialog(
                context: context,
                builder: (context) {
                  return RentFilter();
                },
              );
        }, onFavorite: () { Get.toNamed(AppRoutes.favorite); },)
      ],
    );
  }
}