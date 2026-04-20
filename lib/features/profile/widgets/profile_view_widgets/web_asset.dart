import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/web_asset_items.dart';

class WebAsset extends StatelessWidget {
  const WebAsset({super.key});

  @override
  Widget build(BuildContext context) {
        ProfileController profileController = Get.find();
    return Obx(() {
          return Column(
            children: [
              ProfileItems(
                imageHeight: 21.5.h,
                imageWidth: 21.5.w,
                image: IconsPath.profileWeb,
                title: 'Web Assets',
                secondaryWidget: SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: Center(
                    child: Image.asset(
                      profileController.isWebAsset.value
                          ? IconsPath.upArrow
                          : IconsPath.downArrow,
                      height: 7.5.h,
                      width: 15.w,
                    ),
                  ),
                ),
                onTap: () {
                  profileController.isWebAsset.value =
                        !profileController.isWebAsset.value;
                },
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: profileController.isWebAsset.value ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: profileController.isWebAsset.value
                      ? WebAssetItems()
                      : SizedBox(),
                ),
              ),
            ],
          );
        });
  }
}