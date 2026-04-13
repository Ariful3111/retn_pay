import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_update_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class InspectionTableData extends GetWidget<InspectionRequestController> {
  final int id;
  const InspectionTableData({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final list = controller.inspections.value?.data ?? [];
    final itemIndex = list.indexWhere((element) => element.id == id);
    if (itemIndex == -1) {
      return SizedBox.shrink();
    }
    final isValue = list[itemIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isValue.status?.capitalizeFirst == 'Approved' ||
            isValue.status?.capitalizeFirst == 'Assigned' ||
            isValue.status?.capitalizeFirst == 'Open' ||
            isValue.status?.capitalizeFirst == 'Scheduled') ...[
          Obx(() {
            return Get.find<InspectionUpdateController>().isLoading.value
                ? ButtonLoading(loadingSize: 10.sp)
                : TableActionButton(
                    icon: IconsPath.tableClose,
                    onTap: () async {
                      await Get.find<InspectionUpdateController>()
                          .updateInspection(status: "cancelled", id: id);
                    },
                  );
          }),
        ],

        if (isValue.status?.capitalizeFirst == 'Completed') ...[
          TableActionButton(
            icon: IconsPath.tableUpload,
            color: AppColors.tableUpload,
            onTap: () {
              Get.toNamed(AppRoutes.applicationManagementDetails);
            },
          ),
        ],
        if (isValue.status?.capitalizeFirst == 'Pending') ...[
          TableActionButton(
            icon: IconsPath.tableClose,
            onTap: () async {
              await Get.find<InspectionUpdateController>().updateInspection(
                status: "cancelled",
                id: id,
              );
            },
          ),
        ],
        if (isValue.status?.capitalizeFirst != 'Rejected' &&
            isValue.status?.capitalizeFirst != 'Cancel' &&
            isValue.status?.capitalizeFirst != 'Pending' &&
            isValue.type?.capitalizeFirst == "Virtual") ...[
          TableActionButton(
            icon: IconsPath.tableInspection,
            color: AppColors.borderColor,
            onTap: () {},
          ),
        ],
      ],
    );
  }
}
