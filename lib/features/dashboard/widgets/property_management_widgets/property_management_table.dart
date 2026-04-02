import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table_action.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table_data.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PropertyManagementTable extends StatefulWidget {
  const PropertyManagementTable({super.key});

  @override
  State<PropertyManagementTable> createState() =>
      _PropertyManagementTableState();
}

class _PropertyManagementTableState extends State<PropertyManagementTable> {
  final homeController = Get.find<HomeController>();
  PropertyManagementController propertyManagementController = Get.find();

  @override
  void initState() {
    super.initState();
    if (homeController.properties.value == null) {
      homeController.getProperties();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      // Sync allRows from homeController when properties change
      if (!homeController.isLoading.value &&
          homeController.properties.value != null) {
        propertyManagementController.syncAllRowsFromProperties();
      }

      return homeController.isLoading.value
          ? ButtonLoading()
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
              ),
              child: (() {
                bool isProperty =
                    propertyManagementController.selected.value == 'Property';
                final list = homeController.properties.value?.data?.data;
                final rowWidgets = List<List<Widget>>.generate(
                  list?.length ?? 0,
                  (index) {
                    final item = list?[index];
                    return [
                      CustomTextPrimary(
                        text: item?.address ?? "",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      isProperty
                          ? userIndex == 2
                                ? CustomTextSecondary(
                                    text: (item?.units?.isNotEmpty ?? false)
                                        ? item!.units!.first.rentAmount ?? ""
                                        : "-",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  )
                                : PropertyManagementTableData(index: index)
                          : CustomTextSecondary(
                              text: item?.createdAt ?? "",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                      isProperty
                          ? item?.status == 'Approved' || userIndex == 2
                                ? PropertyManagementTableAction(index: index)
                                : SizedBox.shrink()
                          : CustomFilterAppbar(
                              width: 100.w,
                              height: 34.h,
                              title: 'Download',
                              icon: IconsPath.export,
                              onTap: () {},
                            ),
                    ];
                  },
                );
                final listIndex = List<int>.generate(
                  list?.length ?? 0,
                  (i) => i,
                );
                return CustomTable(
                  column: isProperty
                      ? userIndex == 2
                            ? propertyManagementController.agentTableColumn
                            : propertyManagementController.tableColumn
                      : propertyManagementController.conditionReportTableColumn,
                  row: rowWidgets,
                  expandedTableBuilder: (index) {
                    final item = list?[index];
                    final rowIndex = listIndex[index];
                    return CustomTableExpanded(
                      title: 'Property Address: ${item?.address ?? ""}',
                      isOpen:
                          rowIndex <
                              propertyManagementController.expanded.length
                          ? propertyManagementController.expanded[rowIndex]
                          : false,
                      onExpandedClose: () {
                        propertyManagementController.toggleExpanded(rowIndex);
                      },
                      expandedContent: PropertyManagementTableContent(
                        property: item!,
                      ),
                    );
                  },
                  onRowTap: (index) {
                    propertyManagementController.toggleExpanded(
                      listIndex[index],
                    );
                  },
                  isExpandedTableBuilder: (index) {
                    final rowIndex = listIndex[index];
                    if (rowIndex >=
                        propertyManagementController.expanded.length) {
                      return false;
                    }
                    return propertyManagementController.expanded[rowIndex];
                  },
                  isNeedLastCol: isProperty ? true : false,
                );
              })(),
            );
    });
  }
}
