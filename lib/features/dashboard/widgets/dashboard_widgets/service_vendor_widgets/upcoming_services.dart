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
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class UpcomingServices extends GetView<ServiceVendorDashboardController> {
  const UpcomingServices({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final list = controller.requests
          .where((r) => (r.status ?? '').toLowerCase() == 'pending')
          .toList();
      final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
        final item = list[index];
        return [
          CustomTextPrimary(
            text: item.service?.name ?? '',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
          ),
          CustomTextPrimary(
            text: item.property?.title ?? item.property?.name ?? '',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
          ),
          TableStatus(status: item.status ?? ''),
          TableActionButton(icon: IconsPath.actonView, onTap: () {}),
        ];
      });
      return controller.isLoading.value
          ? ButtonLoading()
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
              ),
              child: CustomTable(
                column: controller.tableColumn,
                row: rowWidgets,
                onRowTap: (index) {},
                isExpandedTableBuilder: (index) => false,
                isNeedLastCol: false,
              ),
            );
    });
  }
}
