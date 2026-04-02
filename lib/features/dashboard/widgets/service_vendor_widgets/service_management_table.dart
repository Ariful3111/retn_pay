import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';
import 'package:renter_pay/features/dashboard/models/service_list_model.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ServiceManagementTable extends GetView<ServiceManagementController> {
  const ServiceManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: ButtonLoading());
      }

      final list = controller.filterRow;
      if (list.isEmpty) {
        return Center(
          child: CustomTextPrimary(text: 'No services found', fontSize: 14.sp),
        );
      }

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: _buildTable(list),
      );
    });
  }

  Widget _buildTable(List<ServiceItem> list) {
    final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
      final item = list[index];
      return [
        CustomTextPrimary(
          text: item.title ?? '-',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textOverflow: TextOverflow.ellipsis,
        ),
        TableStatus(status: item.status ?? '-'),
        TableActionButton(
          icon: IconsPath.actonView,
          onTap: () {
            Get.toNamed(AppRoutes.serviceSearchDetails, arguments: item.id);
          },
        ),
      ];
    });

    return CustomTable(
      column: controller.tableColumn,
      row: rowWidgets,
      onRowTap: (index) {},
      isExpandedTableBuilder: (index) {
        return controller.expanded[index];
      },
      isNeedLastCol: false,
    );
  }
}
