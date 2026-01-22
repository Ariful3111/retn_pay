import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/landlord_repair_maintenance/landlord_repair_maintenance_upload_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordRepairMaintenanceTableContent extends StatelessWidget {
  final int index;
  const LandlordRepairMaintenanceTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    LandlordRepairMaintenanceController landlordRepairMaintenanceController =
        Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final item = landlordRepairMaintenanceController.dataList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       if(userIndex==1) info(text: 'Tenant Name:${item.tenantName}'),
       if(userIndex==1) SizedBox(height: 8.h),
        info(text: 'Urgency:${item.urgency}'),
        SizedBox(height: 8.h),
        Row(
          children: [
            info(text: 'Status:'),
            SizedBox(width: 8.w),
            TableStatus(status: item.status),
          ],
        ),
        if (item.status == 'Completed'&&userIndex==1) info(text: 'Receipt:'),
        if (item.status == 'Completed'&&userIndex==1)
          Row(
            children: [
              TableActionButton(
                icon: IconsPath.receiptUpload,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return LandlordRepairMaintenanceUploadDialog();
                    },
                  );
                },
                iconColor: isDark ? AppColors.whiteColor : null,
              ),
              SizedBox(width: 8.w),
              TableActionButton(
                icon: IconsPath.export,
                onTap: () {},
                iconColor: isDark ? AppColors.whiteColor : null,
              ),
            ],
          ),
        SizedBox(height: 8.h),
      ],
    );
  }

  info({required String text}) {
    return CustomTextPrimary(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
