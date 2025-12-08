import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionTable extends StatelessWidget {
  const InspectionTable({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionRequestController inspectionRequestController = Get.find();
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
        child: Obx(() {
          final list = inspectionRequestController.filterRow;
          final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
            final item = list[index].value;
            final value = list[index].key;
            final isValue = inspectionRequestController.allRows[value];
            return [
              CustomTextPrimary(
                text: item.address,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              TableStatus(status: item.status),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isValue.status == 'Approved') ...[
                    action(
                      icon: IconsPath.tableClose,
                      onTap: () {
                       
                      }, context: context,
                    ),
                  ],

                  if (isValue.status == 'Complete') ...[
                    action(
                      icon: IconsPath.tableClose,
                      onTap: () {
                        
                      }, context: context,
                    ),
                    action(
                      icon: IconsPath.tableUpload,
                      color: AppColors.tableUpload,
                      onTap: () {}, context: context,
                    ),
                  ],
                  if(isValue.status == 'Pending')...[
                    action(
                      icon: IconsPath.tableClose,
                      onTap: () {
                        inspectionRequestController.updateStatus(
                          list[index].key,'Cancel'
                        );
                      }, context: context,
                    ),
                  ],
                  if (isValue.type == "VR"&& isValue.status !='Complete'&& isValue.status !='Rejected'&&isValue.status !='Cancel'&&isValue.status!='Pending') ...[ 
                    action(
                      icon: IconsPath.tableInspection,
                      color: AppColors.borderColor,
                      onTap: () {}, context: context,
                    ),
                  ],
                ],
              ),
            ];
          });
          final listIndex = list.map((e) => e.key).toList();
          return CustomTable(
            column: inspectionRequestController.tableColumn,
            row: rowWidgets,
            listIndex: listIndex,
          );
        }),
      ),
    );
  }

  Widget action({
    required String icon,
    Color? color,
    required VoidCallback onTap,
    Color? iconColor,
    required BuildContext context,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.r),
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
          color:isDark?color??AppColors.darkContainer :color ?? AppColors.whiteColor,
          border: Border.all(width: 1.r, color:isDark?AppColors.darkBorderPrimary :AppColors.whiteBorder),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Image.asset(icon, height: 24.h, width: 24.w, color: iconColor),
        ),
      ),
    );
  }
}
