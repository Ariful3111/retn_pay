import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/controllers/start_deposit_controller.dart';
import 'package:renter_pay/features/profile/controllers/withdraw_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class WalletItems extends StatelessWidget {
  const WalletItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          Obx(() {
            return Get.find<StartDepositController>().isLoading.value
                ? ButtonLoading(verticalPadding: 15.h)
                : ProfileItems(
                    image: IconsPath.upload,
                    imageHeight: 24.h,
                    imageWidth: 24.w,
                    title: 'Deposit',
                    onTap: () async {
                      await Get.find<StartDepositController>().startDeposit();
                    },
                  );
          }),
          SizedBox(height: 8.h),
          Obx(() {
            return Get.find<WithdrawController>().isLoading.value
                ? ButtonLoading(verticalPadding: 15.h)
                : ProfileItems(
                    image: IconsPath.export,
                    imageHeight: 24.h,
                    imageWidth: 24.w,
                    title: 'Withdraw',
                    onTap: () async {
                      await Get.find<WithdrawController>().withdraw();
                    },
                  );
          }),
        ],
      ),
    );
  }
}
