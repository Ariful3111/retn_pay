import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';
import 'package:renter_pay/features/profile/widgets/profile_shared_item.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_user_items.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/web_asset.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ProfileItemsList extends StatelessWidget with ProfileSharedItem{
  const ProfileItemsList({super.key});
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ProfileItems(
          imageHeight: 23.h,
          imageWidth: 22.w,
          image: IconsPath.profileNotification,
          title: 'Notifications',
          secondaryWidget: Container(
            height: 24.h,
            width: 24.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColors.darkAppBar,
            ),
            child: Center(
              child: CustomTextPrimary(
                text: '3',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF002256),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(AppRoutes.notification);
          },
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rowItem(IconsPath.profileDashboard, 'DashBoard', 23.h, 23.w, () {}),
            rowItem(IconsPath.profileBlog, 'Blog', 23.h, 23.w, () {
              Get.toNamed(AppRoutes.blog);
            }),
          ],
        ),
        SizedBox(height: 8.h),
        WebAsset(),
        SizedBox(height: 8.h),
        ProfileUserItems()
      ],
    );
  }
}
