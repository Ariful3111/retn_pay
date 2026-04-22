import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_favorite_appbar.dart';

class RentAppBar extends StatelessWidget {
  const RentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CustomAppbarLeading(onTap: () {}),
        // SizedBox(width: 10.w),
        CustomAppbar(title: 'Property'),
        Spacer(),
        CustomFavoriteAppbar(
          onFavorite: () {
            Get.toNamed(AppRoutes.favorite);
          },
        ),
        // SizedBox(width: 8.w),
        // CustomFilterAppbar(
        //   onTap: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) {
        //         return RentFilter();
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }
}
