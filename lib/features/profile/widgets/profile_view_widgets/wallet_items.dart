import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';

class WalletItems extends StatelessWidget {
  const WalletItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          ProfileItems(
            image: IconsPath.upload,
            imageHeight: 24.h,
            imageWidth: 24.w,
            title: 'Deposit',
            onTap: () {
              Get.toNamed(AppRoutes.depositView);
            },
          ),

          SizedBox(height: 8.h),
          ProfileItems(
            image: IconsPath.export,
            imageHeight: 24.h,
            imageWidth: 24.w,
            title: 'Withdraw',
            onTap: () {
              Get.toNamed(AppRoutes.withdrawView);
            },
          ),
        ],
      ),
    );
  }
}
