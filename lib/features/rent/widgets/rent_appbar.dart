import 'package:flutter/material.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';


class RentAppbar extends StatelessWidget {
  const RentAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      title: "Property",
    );
  }
}
