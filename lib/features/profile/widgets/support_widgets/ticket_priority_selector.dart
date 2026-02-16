import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class TicketPrioritySelector extends StatelessWidget {
  const TicketPrioritySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupportController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: 'Priority', fontSize: 18.sp),
        SizedBox(height: 10.h),
        Obx(
          () => Row(
            children: List.generate(controller.priorityList.length, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: CustomRadioButton(
                  value: index,
                  groupValue: controller.priorityIndex.value,
                  onChange: (value) {
                    controller.priorityIndex.value = value!;
                  },
                  text: controller.priorityList[index],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
