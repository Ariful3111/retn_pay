import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_request_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RepairTypes extends StatelessWidget {
  const RepairTypes({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RepairMaintenanceController repairMaintenanceController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          height: 45.h,
          width: 176.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.69.r),
            gradient: isDark ? AppColors.darkAppIcon : LinearGradient(colors: [AppColors.whiteColor,AppColors.whiteColor]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              repairMaintenanceController.repairType.length,
              (index) {
                return Obx(() {
                  final isActive =
                      repairMaintenanceController.repairTypeIndex.value ==
                      index;
                  return GestureDetector(
                    onTap: () {
                      repairMaintenanceController.repairTypeIndex.value = index;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.05.h,
                        horizontal: 12.07.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.46.r),
                        color: isActive ? AppColors.primaryColorDark : null,
                      ),
                      child: CustomTextSecondary(
                        text: repairMaintenanceController.repairType[index],
                        fontSize: 14.sp,
                        color: isActive ? AppColors.whiteColor : AppColors.darkPrimary,
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ),
        RepairRequestButton(),
      ],
    );
  }
}
