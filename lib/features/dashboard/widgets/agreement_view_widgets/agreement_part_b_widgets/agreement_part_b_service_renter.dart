import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_b_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartBServiceRenter extends GetWidget<AgreementPartBController> {
  const AgreementPartBServiceRenter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();
    return Obx(
          () => Column(
            children: List.generate(controller.renters.length, (index) {
              final renter = controller.renters[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextSecondary(
                    text: renter.title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Obx(
                        () => CustomCheckBox(
                          isChecked: renter.isYes.value,
                          onChange: (val) {
                            renter.isYes.value = val;
                            if (val) renter.isNo.value = false;
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: CustomTextSecondary(
                          text:
                              'Yes - insert email address, mobile phone number or other electronic contact details',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Obx(
                        () => CustomCheckBox(
                          isChecked: renter.isNo.value,
                          onChange: (val) {
                            renter.isNo.value = val;
                            if (val) renter.isYes.value = false;
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      CustomTextSecondary(
                        text: 'No',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  helper.agreementField(
                    label: '',
                    controller: renter.controller,
                    isDark: isDark,
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.h),
                  if (index != controller.renters.length - 1)
                    helper.divider(isDark: isDark),
                  SizedBox(height: 16.h),
                ],
              );
            }),
          ),
        );
  }
}