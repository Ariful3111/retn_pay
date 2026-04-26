import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/rent_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_management_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/rent_management_widgets/rent_management_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RentManagementTable extends StatelessWidget {
  const RentManagementTable({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentManagementController rentManagementController = Get.find();
    ServicePaymentManagementController servicePaymentManagementController =
        Get.find();
    return Column(
      children: [
        PaymentManagementFilter(),
        SizedBox(height: 20.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          ),
          child: Obx(() {
            final list = rentManagementController.filterRow;
            final isRentHistory =
                Get.find<PaymentManagementController>()
                    .paymentTypeIndex
                    .value ==
                1;
            final rowWidgets = List<List<Widget>>.generate(list.length, (
              index,
            ) {
              final item = list[index].value;
              return [
                CustomTextPrimary(
                  text: userIndex == 3 ? item.plan : item.tenantName,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textOverflow: TextOverflow.ellipsis,
                ),
                CustomTextPrimary(
                  text:userIndex==3?item.amount :item.date,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textOverflow: TextOverflow.ellipsis,
                ),
                if (userIndex == 2)
                  isRentHistory
                      ? TableActionButton(icon: IconsPath.export, onTap: () {})
                      : CustomTextPrimary(
                          text: item.amount,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                if (userIndex == 3)
                  Row(
                    children: [
                      TableActionButton(
                        icon: IconsPath.actonView,
                        onTap: () {},
                      ),
                      TableActionButton(
                        icon: IconsPath.export,
                        onTap: () {},
                      ),
                    ],
                  ),
              ];
            });
            final listIndex = list.map((e) => e.key).toList();
            return CustomTable(
              column: userIndex == 3
                  ? servicePaymentManagementController.tableColumn
                  : rentManagementController.tableColumn,
              row: rowWidgets,
              expandedTableBuilder: (index) {
                final item = list[index].value;
                final rowIndex = listIndex[index];
                return CustomTableExpanded(
                  title:userIndex==3? 'Payment Date: ${item.date}':'Property Address: ${item.propertyAddress}',
                  isOpen: rentManagementController.expanded[rowIndex],
                  onExpandedClose: () {
                    rentManagementController.toggleExpanded(rowIndex);
                  },
                  expandedContent:userIndex==3? SizedBox(height: 20.h,):RentManagementTableContent(index: rowIndex),
                );
              },
              onRowTap: (index) {
                rentManagementController.toggleExpanded(listIndex[index]);
              },
              isExpandedTableBuilder: (index) {
                return rentManagementController.expanded[listIndex[index]];
              },
              isNeedLastCol: true,
            );
          }),
        ),
      ],
    );
  }
}
