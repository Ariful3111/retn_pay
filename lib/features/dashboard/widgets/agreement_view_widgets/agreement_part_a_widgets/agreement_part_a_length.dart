import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';

class AgreementPartALength extends GetWidget<AgreementPartAController> {
  final AgreementHelper _helper = AgreementHelper();

  AgreementPartALength({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFixedTermSection(context, isDark),
        SizedBox(height: 16.h),
        _buildPeriodicAgreementSection(context, isDark),
        _helper.richText(
          title: 'Note: ',
          spantext:
              'A periodic (e.g. month by month) rental agreement will be formed at the end of the fixed term agreement if the renter and rental provider do not sign a new fixed term agreement and the renter stays in the property.',
        ),
      ],
    );
  }

  // Fixed Term Agreement Section
  Widget _buildFixedTermSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => _helper.checkboxWithText(
            isChecked: controller.isAgreement.value,
            onChanged: (value) {
              controller.isAgreement.value = value!;
            },
            text: 'Fixed term agreement',
          ),
        ),
        SizedBox(height: 16.h),
        _helper.dateFieldWithPicker(
          context: context,
          labelText:
              'Start date (this is the date the agreement starts and you may move in)',
          controller: controller.fixedTermStartDateController,
          isDark: isDark,
        ),
        SizedBox(height: 16.h),
        _helper.dateFieldWithPicker(
          context: context,
          labelText: 'End date',
          controller: controller.fixedTermEndDateController,
          isDark: isDark,
        ),
        SizedBox(height: 16.h),
        _helper.divider(isDark: isDark),
      ],
    );
  }

  Widget _buildPeriodicAgreementSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => _helper.checkboxWithText(
            isChecked: controller.isPeriodic.value,
            onChanged: (value) {
              controller.isPeriodic.value = value!;
            },
            text: 'Periodic agreement (monthly)',
          ),
        ),
        SizedBox(height: 16.h),
        _helper.dateFieldWithPicker(
          context: context,
          labelText: 'Start date',
          controller: controller.periodicStartDateController,
          isDark: isDark,
        ),
      ],
    );
  }
}
