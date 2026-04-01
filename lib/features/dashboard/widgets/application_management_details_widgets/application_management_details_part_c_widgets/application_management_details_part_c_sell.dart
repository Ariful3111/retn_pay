import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementDetailsPartCSell
    extends GetWidget<ApplicationManagementDetailsTableController> {
  final int index;

  const ApplicationManagementDetailsPartCSell({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final item = controller.disclosureItems[index];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),

          CustomTextPrimary(
            text: 'If Yes:',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),

          SizedBox(height: 8.h),

          _row(
            'a. I have engaged an agent',
            item.yesAnswerA,
            item.noAnswerA,
            (v) => controller.updateYesAnswerA(index, v),
            (v) => controller.updateNoAnswerA(index, v),
          ),

          _row(
            'b. Contract of sale prepared',
            item.yesAnswerB,
            item.noAnswerB,
            (v) => controller.updateYesAnswerB(index, v),
            (v) => controller.updateNoAnswerB(index, v),
          ),
        ],
      );
    });
  }

  Widget _row(
    String text,
    bool yes,
    bool no,
    ValueChanged onYes,
    ValueChanged onNo,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomTextPrimary(
              text: text,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: CustomCheckBox(isChecked: yes, onChange: onYes),
          ),
          Expanded(
            child: CustomCheckBox(isChecked: no, onChange: onNo),
          ),
        ],
      ),
    );
  }
}
