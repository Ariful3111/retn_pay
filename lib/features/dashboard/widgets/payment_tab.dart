import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/payment_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PaymentTab extends StatelessWidget {
  const PaymentTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    PaymentManagementController paymentManagementController = Get.find();
    return Container(
      padding: EdgeInsets.all(4.r),
      height: 45.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(9.63.r),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: paymentManagementController.paymentType.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelect =
                paymentManagementController.paymentTypeIndex.value == index;
            return GestureDetector(
              onTap: () {
                paymentManagementController.paymentTypeIndex.value = index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.42.r),
                  color: isSelect ? AppColors.primaryColorDark : null,
                ),
                child: CustomTextSecondary(
                  text: paymentManagementController.paymentType[index],
                  fontSize: 14.sp,
                  color: isSelect ? AppColors.whiteColor : null,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
