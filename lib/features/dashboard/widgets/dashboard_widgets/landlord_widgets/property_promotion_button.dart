import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landrord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyPromotionButton extends StatelessWidget {
  const PropertyPromotionButton({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardLandlordController dashboardLandlordController = Get.find();
    return Column(
      children: [
        ...List.generate(3, (index) {
          return Obx(() {
            bool isSelected =
                dashboardLandlordController.checkedIndex.value == index;
            return Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  CustomCheckBox(
                    isChecked: isSelected,
                    onChange: (value) {
                      dashboardLandlordController.checkedIndex.value = index;
                    },
                  ),
                  SizedBox(width: 4.w),
                  CustomTextSecondary(text: '\$7.99/week'),
                ],
              ),
            );
          });
        }),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryButton(
              onPressed: () {},
              height: 48.h,
              width: 134.w,
              text: 'Purchase',
            ),
            SizedBox(width: 12.w),
            CustomSecondaryButton(
              onPressed: () {},
              height: 48.h,
              width: 107.w,
              text: 'Later',
            ),
          ],
        ),
      ],
    );
  }
}
