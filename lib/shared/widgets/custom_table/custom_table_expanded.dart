import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/expanded_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class CustomTableExpanded extends StatelessWidget {
  final int rowIndex;
  const CustomTableExpanded({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InspectionRequestController>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      if (rowIndex < 0 || rowIndex >= controller.allRows.length) {
        return SizedBox.shrink();
      }
      final isOpen = controller.expanded[rowIndex];
      final item = controller.allRows[rowIndex];
      return AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child:AnimatedSwitcher(
           duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeOut,
          child: isOpen? Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextPrimary(
                      text: "Property Address: ${item.address}",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.toggleExpanded(rowIndex);
                      },
                      child: Container(
                        height: 36.h,
                        width: 36.h,
                        decoration: BoxDecoration(
                          color:isDark? AppColors.darkBorderPrimary:AppColors.whiteButtonColor,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Center(
                          child: Image.asset(
                            IconsPath.close,
                            height: 8.25.h,
                            width: 8.25.w,
                            color: isDark?AppColors.darkAppBar:null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedOpacity(
                          opacity: isOpen ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, -0.05),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: controller.animationController,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: ExpandedTableContent(rowIndex: rowIndex),
                          ),
                        ),
              ],
            ),
          ):SizedBox(),
        ),
      );
    });
  }
}
