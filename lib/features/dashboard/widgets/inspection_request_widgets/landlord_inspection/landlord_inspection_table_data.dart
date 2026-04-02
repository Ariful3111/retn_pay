import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';

class LandlordInspectionTableData extends StatelessWidget {
  final int index;
  const LandlordInspectionTableData({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<InspectionRequestController>();
    final list = controller.inspections.value?.data ?? const [];
    final itemIndex = list.indexWhere((element) => element.id == index);
    if (itemIndex == -1) {
      return const SizedBox.shrink();
    }
    final isValue = list[itemIndex];
    final status = isValue.status?.capitalizeFirst ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (status == 'Pending' ||
            status == 'Approved' ||
            status == 'Completed')
          TableActionButton(
            icon: IconsPath.actonView,
            onTap: () {
              Get.toNamed(
                AppRoutes.landlordInspectionView,
                arguments: isValue.id,
              );
            },
            iconColor: isDark ? AppColors.whiteColor : null,
          ),
        SizedBox(width: 8.w),
        if (status == 'Approved')
          TableActionButton(
            icon: IconsPath.check,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LandlordInspectionViewDialog();
                },
              );
            },
            iconColor: isDark ? AppColors.whiteColor : null,
          ),
      ],
    );
  }
}
