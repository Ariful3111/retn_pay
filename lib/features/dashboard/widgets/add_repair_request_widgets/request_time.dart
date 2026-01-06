import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RequestTime extends StatelessWidget {
  const RequestTime({super.key});

  @override
  Widget build(BuildContext context) {
    AddRepairRequestController addRepairRequestController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(addRepairRequestController.timePeriodList.length, (
          index,
        ) {
          return Obx(() {
            final isChecked =
                addRepairRequestController.checkboxIndex.value == index;
            return Row(
              children: [
                CustomCheckBox(
                  isChecked: isChecked,
                  onChange: (value) {
                    addRepairRequestController.checkboxIndex.value = index;
                  },
                ),
                CustomTextPrimary(
                  text: addRepairRequestController.timePeriodList[index],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                if (index == 3)
                  Container(
                    height: 26.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0.64),
                          blurRadius: 1.27,
                          color: AppColors.dropShadowColorSecondary.withValues(
                            alpha: 0.24,
                          ),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: addRepairRequestController.timeController,
                        labelText: 'Other',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: isDark
                            ? AppColors.darkPrimary
                            : AppColors.whiteColor,
                        enableBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.64.w,
                            color: isDark
                                ? AppColors.darkBorderPrimary
                                : AppColors.primaryBorder,
                          ),
                          borderRadius: BorderRadius.circular(6.35),
                        ),
                        focusBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.64.w,
                            color: isDark
                                ? AppColors.darkBorderPrimary
                                : AppColors.primaryBorder,
                          ),
                          borderRadius: BorderRadius.circular(6.35),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.64.w,
                            color: isDark
                                ? AppColors.darkBorderPrimary
                                : AppColors.primaryBorder,
                          ),
                          borderRadius: BorderRadius.circular(6.35),
                        ),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        padding: EdgeInsetsGeometry.zero,
                      ),
                    ),
                  ),
              ],
            );
          });
        }),
      ],
    );
  }
}
