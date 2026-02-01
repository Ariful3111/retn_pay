import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';

class InspectionTableData extends StatelessWidget {
  final int index;
  const InspectionTableData({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    InspectionRequestController inspectionRequestController = Get.find();
    final list = inspectionRequestController.filterRow;
    final value = list[index].key;
    final isValue = inspectionRequestController.allRows[value];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isValue.status == 'Approved') ...[
          TableActionButton(icon: IconsPath.tableClose, onTap: () {}),
        ],

        if (isValue.status == 'Completed') ...[
          
          TableActionButton(
            icon: IconsPath.tableUpload,
            color: AppColors.tableUpload,
            onTap: () {},
          ),
        ],
        if (isValue.status == 'Pending') ...[
          TableActionButton(icon: IconsPath.tableClose, onTap: () {}),
        ],
        if (isValue.status != 'Rejected' &&
            isValue.status != 'Cancel' &&
            isValue.status != 'Pending' &&isValue.type == "VR"
           ) ...[
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
