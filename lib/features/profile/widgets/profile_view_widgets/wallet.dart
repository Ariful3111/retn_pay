import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/wallet_items.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    return Obx(() {
      return Column(
        children: [
          ProfileItems(
            imageHeight: 21.5.h,
            imageWidth: 21.5.w,
            image: IconsPath.profilePayment,
            title: 'Wallet',
            secondaryWidget: SizedBox(
              height: 24.h,
              width: 24.h,
              child: Center(
                child: Image.asset(
                  profileController.isWallet.value
                      ? IconsPath.upArrow
                      : IconsPath.downArrow,
                  height: 7.5.h,
                  width: 15.w,
                ),
              ),
            ),
            onTap: () {
              profileController.isWallet.value =
                  !profileController.isWallet.value;
            },
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
              opacity: profileController.isWallet.value ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: profileController.isWallet.value
                  ? WalletItems()
                  : SizedBox(),
            ),
          ),
        ],
      );
    });
  }
}
