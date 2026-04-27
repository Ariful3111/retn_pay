import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/checkout/controller/balance_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ProfileInfo extends StatelessWidget {
  final ProfileController controller;
  final BalanceController balanceController;
  const ProfileInfo({
    super.key,
    required this.controller,
    required this.balanceController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String contact = controller.profileData.value?.data?.email ?? '';
      String profilePic =
          controller.profileData.value?.data?.image.toString() ?? '';
      String balance =
          balanceController.balance.value?.data?.fiatBalanceAud ?? '0.00';
      String symbol =
          balanceController.balance.value?.data?.displayCurrency?.symbol ?? '';
      if (contact.isEmpty || contact == 'null') {
        contact = controller.profileData.value?.data?.phone ?? '';
      }
      if (!profilePic.contains('http')) {
        profilePic = ImagesPath.profile;
      }
      return balanceController.isLoading.value
          ? ButtonLoading()
          : GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.profileEdit);
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 25.w,
                  top: 20.h,
                  bottom: 20.h,
                ),
                width: MediaQuery.widthOf(context),
                // height: 105.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  gradient: AppColors.primaryColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 65.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.sp,
                          color: AppColors.darkAppBar,
                        ),
                        image: DecorationImage(
                          image: profilePic.contains('http')
                              ? CachedNetworkImageProvider(profilePic)
                              : AssetImage(profilePic),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextPrimary(
                            text:
                                controller.profileData.value?.data?.name ?? '',
                            color: AppColors.whiteColor,
                            fontSize: 20.sp,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.h),
                          CustomTextPrimary(
                            text: contact,
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          CustomTextPrimary(
                            text: "Balance: $symbol$balance",
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.toNamed(AppRoutes.profileEdit);
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Center(
                          child: Image.asset(
                            IconsPath.forwardArrow,
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
