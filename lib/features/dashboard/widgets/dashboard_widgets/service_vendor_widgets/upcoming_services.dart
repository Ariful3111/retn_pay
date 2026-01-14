import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class UpcomingServices extends StatelessWidget {
  const UpcomingServices({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceVendorDashboardController serviceVendorDashboardController =
        Get.find();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = serviceVendorDashboardController.filterRow;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.name,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),
            CustomTextPrimary(
              text: item.area,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status),
            TableActionButton(icon: IconsPath.actonView, onTap: () {}),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: serviceVendorDashboardController.tableColumn,
          row: rowWidgets,
          onRowTap: (index) {
           
          },
          isExpandedTableBuilder: (index) {
            return serviceVendorDashboardController
                .expandedData[listIndex[index]];
          },
          isNeedLastCol: false,
        );
      }),
    );
  }
}
