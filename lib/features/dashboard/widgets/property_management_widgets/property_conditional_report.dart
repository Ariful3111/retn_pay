import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/download_manager.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_conditional_report_content.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class PropertyConditionalReport
    extends GetWidget<PropertyManagementController> {
  const PropertyConditionalReport({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: controller.isLoading.value ? ButtonLoading() : _table(),
      );
    });
  }

  Widget _table() {
    final list = controller.conditionReports;
    final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
      final item = list[index];
      return [
        CustomTextPrimary(
          text: item.property?.address ?? '',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
        ),
        CustomTextSecondary(
          text: item.createdAt ?? '',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        CustomFilterAppbar(
          width: 100.w,
          height: 34.h,
          title: 'Download',
          icon: IconsPath.export,
          onTap: () async {
            debugPrint("Started downloading...");
            final response = await DownloadManager.download(
              url: item.fileUrl ?? '',
            );
            debugPrint("Saved to: ${response.path}");
            SuccessSnackbar.show(
              description: "Downloaded to: ${response.path}",
            );
          },
        ),
      ];
    });
    return CustomTable(
      column: controller.conditionReportTableColumn,
      row: rowWidgets,
      expandedTableBuilder: (index) {
        final item = list[index];
        final rowIndex = index;
        return CustomTableExpanded(
          title: 'Property Address: ${item.property?.address ?? ''}',
          isOpen: rowIndex < controller.expandedCondition.length
              ? controller.expandedCondition[rowIndex]
              : false,
          onExpandedClose: () {
            controller.toggleCondition(rowIndex);
          },
          expandedContent: PropertyConditionalReportContent(rowIndex: rowIndex),
        );
      },
      onRowTap: (index) {
        controller.toggleCondition(index);
      },
      isExpandedTableBuilder: (index) {
        if (index >= controller.expandedCondition.length) return false;
        return controller.expandedCondition[index];
      },
      isNeedLastCol: false,
    );
  }
}
