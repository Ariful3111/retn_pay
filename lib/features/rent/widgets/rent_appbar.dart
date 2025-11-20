import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/widgets/rent_filter.dart';
import 'package:renter_pay/shared/widgets/custom_end_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar.dart';


class RentAppbar extends StatelessWidget {
  const RentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      title: "Property",
      image: IconsPath.appbarBack,
      imageHeight: 21.5,
      imageWidth: 21.5,
      onTap: () {},
      secondaryWidget: CustomEndAppbar(onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return RentFilter();
                },
              );
            }),
    );
  }
}
