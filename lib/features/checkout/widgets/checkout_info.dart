import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/checkout/controller/balance_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CheckoutInfo extends StatelessWidget {
  const CheckoutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final gender =
        Get.find<ProfileController>().profileData.value?.data?.gender;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(
          title: 'User Name',
          sub:
              Get.find<ProfileController>().profileData.value?.data?.name ?? '',
        ),
        text(title: 'User Type', sub: user(userIndex.toString())),
        text(
          title: 'User Email',
          sub:
              Get.find<ProfileController>().profileData.value?.data?.email ??
              '',
        ),
        if (gender != null && gender.isNotEmpty)
          text(title: 'User Gender', sub: gender),
        text(
          title: 'Current Balance',
          sub:
              "${Get.find<BalanceController>().balance.value?.data?.displayCurrency?.symbol ?? ''}"
              "${(Get.find<BalanceController>().balance.value?.data?.displayBalance ?? 0.0).toStringAsFixed(2)}",
        ),
      ],
    );
  }

  Widget text({required title, required sub}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: title, fontSize: 18.sp),
        SizedBox(height: 8.h),
        CustomTextSecondary(text: sub),
        SizedBox(height: 12.h),
      ],
    );
  }

  String user(String user) {
    if (userIndex == 0) {
      user = 'Tenant';
    } else if (userIndex == 1) {
      user = 'Landlord';
    } else if (userIndex == 2) {
      user = 'Agent';
    } else {
      user = 'Service Vendor';
    }
    return user;
  }
}
