import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionType extends StatelessWidget {
  const InspectionType({super.key});
  @override
  Widget build(BuildContext context) {
    int userIndex = 1;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    InspectionRequestController inspectionRequestController = Get.find();
    LandlordInspectionRequestController landlordInspectionRequestController =
        Get.find();
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.63.r),
          gradient: isDark
              ? AppColors.darkAppIcon
              : LinearGradient(
                  colors: [AppColors.whiteColor, AppColors.whiteColor],
                ),
        ),
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              userIndex == 1
                  ? landlordInspectionRequestController.inspectionType.length
                  : inspectionRequestController.inspectionTypeList.length,
              (index) {
                final isSelected = userIndex == 1
                    ? landlordInspectionRequestController
                              .isLandlordInsPectionType
                              .value ==
                          index
                    : inspectionRequestController.isInspectionType.value ==
                          index;
                return GestureDetector(
                  onTap: () {
                    if (userIndex == 0) {
                      inspectionRequestController.isInspectionType.value =
                          index;
                    }

                    if (userIndex == 1) {
                      landlordInspectionRequestController
                              .isLandlordInsPectionType
                              .value =
                          index;
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.42.r),
                      color: isSelected ? AppColors.primaryColorDark : null,
                    ),
                    child: CustomTextSecondary(
                      text: userIndex == 1
                          ? landlordInspectionRequestController
                                .inspectionType[index]
                          : inspectionRequestController
                                .inspectionTypeList[index],
                      fontSize: 14.sp,
                      color: isSelected
                          ? AppColors.whiteColor
                          : isDark
                          ? AppColors.darkPrimary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
