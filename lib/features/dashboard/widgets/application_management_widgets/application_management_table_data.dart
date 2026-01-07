import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';

class ApplicationManagementTableData extends StatelessWidget {
  final int index;
  const ApplicationManagementTableData({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: TableActionButton(
        icon: IconsPath.actonView,
        onTap: () {},
        iconColor: isDark ? AppColors.whiteColor : null,
      ),
    );
  }
}
