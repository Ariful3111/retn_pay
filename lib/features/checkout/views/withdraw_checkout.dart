import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/checkout/controller/withdraw_controller.dart';
import 'package:renter_pay/features/checkout/widgets/checkout_footer.dart';
import 'package:renter_pay/features/checkout/widgets/checkout_header.dart';
import 'package:renter_pay/features/checkout/widgets/checkout_info.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class WithdrawCheckout extends GetWidget<WithdrawController> {
  const WithdrawCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(24.r),
      child: ListView(
        children: [
          CheckoutHeader(title: 'Withdraw'),
          SizedBox(height: 40.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckoutInfo(),
              SizedBox(height: 12.h),
              CheckoutFooter(
                checkoutType: 'Withdraw Amount',
                controller: controller.withdrawController,
                label: 'Enter Your Withdraw Amount',
              ),
              SizedBox(height: 24.h),
              Obx(() {
                return controller.isLoading.value
                    ? ButtonLoading(verticalPadding: 15.h)
                    : Center(
                      child: CustomPrimaryButton(
                          onPressed: () async{
                              await controller.withdraw();
                          },
                          text: 'Withdraw',
                          padding: EdgeInsets.all(12.r),
                          width: 150.w,
                        ),
                    );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
