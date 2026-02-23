import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';

class LandlordRepairMaintenanceTableData extends StatelessWidget {
  final int? maintenanceRequestId;
  const LandlordRepairMaintenanceTableData({
    super.key,
    required this.maintenanceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: TableActionButton(
        icon: IconsPath.actonView,
        onTap: () {
          final id = maintenanceRequestId;
          if (id == null) return;
          Get.toNamed(AppRoutes.repairRequestView, arguments: id);
        },
        iconColor: isDark ? AppColors.whiteColor : null,
      ),
    );
  }
}
