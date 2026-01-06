import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';

class LandlordInspectionTableData extends StatelessWidget {
  final int index;
  const LandlordInspectionTableData({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    LandlordInspectionRequestController landlordInspectionRequestController =
        Get.find();
    final list = landlordInspectionRequestController.filterRow;
    final value = list[index].key;
    final isValue = landlordInspectionRequestController.allRows[value];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isValue.status == 'Pending' ||
            isValue.status == 'Approved' ||
            isValue.status == 'Complete')
          TableActionButton(
            icon: IconsPath.actonView,
            onTap: () {
              Get.toNamed(AppRoutes.landlordInspectionView);
            },
            iconColor:isDark? AppColors.whiteColor:null,
          ),
        SizedBox(width: 8.w),
        if (isValue.status == 'Approved')
          TableActionButton(icon: IconsPath.check, onTap: () {},iconColor:isDark? AppColors.whiteColor:null,),
      ],
    );
  }
}
