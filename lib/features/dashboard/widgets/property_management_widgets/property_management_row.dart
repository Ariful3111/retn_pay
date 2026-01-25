import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/agent_widgets/property_management_conditional_report.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/new_property_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyManagementRow extends StatelessWidget {
  const PropertyManagementRow({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewPropertyController addNewPropertyController = Get.find();
    PropertyManagementController propertyManagementController = Get.find();
    return Obx(
      () =>
          userIndex == 2 &&
              propertyManagementController.selected.value ==
                  'Conditional Report'
          ? Align(
              alignment: Alignment.centerRight,
              child: add(
                height: 40.h,
                width: 235.w,
                context: context,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PropertyManagementConditionalReport();
                    },
                  );
                },
                text: 'New Conditional Report',
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: propertyManagementController.isViewProperty.value
                  ? Center(
                      child: CustomTextPrimary(
                        text: 'Property Information',
                        fontSize: 24.sp,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextPrimary(text: 'Property', fontSize: 24.sp),
                        add(
                          context: context,
                          onTap: () {
                            addNewPropertyController.isNewProperty.value =
                                !addNewPropertyController.isNewProperty.value;
                          },
                          text: 'New Property',
                        ),
                      ],
                    ),
            ),
    );
  }
}
