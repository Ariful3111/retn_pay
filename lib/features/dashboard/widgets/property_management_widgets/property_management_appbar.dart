import 'package:flutter/material.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_type.dart';

class PropertyManagementAppbar extends StatelessWidget {
  const PropertyManagementAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DrawerItemsAppbar(title: 'Property Management'),
        PropertyManagementType(),
      ],
    );
  }
}
