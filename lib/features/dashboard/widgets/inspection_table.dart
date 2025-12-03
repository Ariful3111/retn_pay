import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionTable extends StatelessWidget {
  const InspectionTable({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionRequestController inspectionRequestController = Get.find();
    inspectionRequestController.initRows(5);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: CustomTable(
          column: List.generate(
            inspectionRequestController.tableColumn.length,
            (index) {
              return inspectionRequestController.tableColumn[index];
            },
          ),
          row: List.generate(5, (rowIndex) {
            return [
              CustomTextPrimary(
                text: '123 Elm Street',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              status(
                status: 'Approved',
                bgColor: isDark
                    ? AppColors.darkApprovedBG
                    : AppColors.approveBG,
                textColor: isDark ? AppColors.approveBG : AppColors.approveText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  action(icon: IconsPath.tableClose, onTap: () {}),
                  SizedBox(width: 8.w),
                  action(
                    icon: IconsPath.tableUpload,
                    color: AppColors.tableUpload,
                    onTap: () {},
                  ),
                  SizedBox(width: 8.w),
                  action(
                    icon: IconsPath.tableInspection,
                    color: AppColors.borderColor,
                    onTap: () {
                      inspectionRequestController.toggleExpanded(rowIndex);
                    },
                  ),
                ],
              ),
            ];
          }), status: status(
                status: 'Approved',
                bgColor: isDark
                    ? AppColors.darkApprovedBG
                    : AppColors.approveBG,
                textColor: isDark ? AppColors.approveBG : AppColors.approveText,
              ),
        ),
      ),
    );
  }

  Widget action({
    required String icon,
    Color? color,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
          color: color ?? AppColors.whiteColor,
          border: Border.all(width: 1.r, color: AppColors.whiteBorder),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Image.asset(icon, height: 24.h, width: 24.w, color: iconColor),
        ),
      ),
    );
  }

  Widget status({
    required String status,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: bgColor,
      ),
      child: CustomTextPrimary(
        text: 'Approved',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
