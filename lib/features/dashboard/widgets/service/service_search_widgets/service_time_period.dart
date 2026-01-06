import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_time_period_field.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceTimePeriod extends StatelessWidget {
  const ServiceTimePeriod({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(serviceSearchController.timePeriodList.length, (
          index,
        ) {
          return Obx(() {
            final isChecked =
                serviceSearchController.checkboxIndex.value == index;
            return Row(
              children: [
                CustomCheckBox(
                  isChecked: isChecked,
                  onChange: (value) {
                    serviceSearchController.checkboxIndex.value = index;
                  },
                ),
                CustomTextPrimary(
                  text: serviceSearchController.timePeriodList[index],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                if (index == 3) ServiceTimePeriodField(),
              ],
            );
          });
        }),
      ],
    );
  }
}
