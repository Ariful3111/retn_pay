import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_drawer/custom_drawer.dart';

class DrawerItemsAppbar extends StatelessWidget {
  final String title;
  const DrawerItemsAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAppbarLeading(
          icon: IconsPath.profileDrawer,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomDrawer();
              },
            );
          },
        ),
        SizedBox(width: 8.w),
        CustomAppbar(title: title),
      ],
    );
  }
}
