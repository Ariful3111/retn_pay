import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceManagementTable extends StatelessWidget {
  const ServiceManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceManagementController serviceManagementController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = serviceManagementController.filterRow;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.serviceName,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status),
            TableActionButton(
              icon: IconsPath.actonView,
              onTap: () {
                Get.toNamed(AppRoutes.serviceSearchDetails);
              },
            ),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: serviceManagementController.tableColumn,
          row: rowWidgets,
          onRowTap: (index) {},
          isExpandedTableBuilder: (index) {
            return serviceManagementController.expanded[listIndex[index]];
          },
          isNeedLastCol: false,
        );
      }),
    );
  }
}
