import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementTableAction extends StatelessWidget {
  final int index;
  const PropertyManagementTableAction({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final selectedItem = propertyManagementController.getMenu(index);
      return PopupMenuButton<MyMenu>(
        color:isDark? AppColors.darkPrimary:AppColors.whiteColor,
        onSelected: (MyMenu menu) {
          propertyManagementController.setMenu(index, menu);
        },
        itemBuilder: (context) {
          return [
            item(
              menu: MyMenu.view,
              icon: IconsPath.actonView,
              text: 'View',
              select: selectedItem == MyMenu.view, context: context,
            ),
            item(
              menu: MyMenu.share,
              icon: IconsPath.share,
              text: 'Share',
              select: selectedItem == MyMenu.share, context: context,
            ),
            item(
              menu: MyMenu.insurance,
              icon: IconsPath.insurance,
              text: 'Insurance',
              select: selectedItem == MyMenu.insurance, context: context,
            ),
            item(
              menu: MyMenu.reEnlist,
              icon: IconsPath.enlist,
              text: 'Re-Enlist',
              select: selectedItem == MyMenu.reEnlist, context: context,
            ),
          ];
        },
      );
    });
  }

  PopupMenuItem<MyMenu> item({
    required MyMenu menu,
    required String icon,
    required String text,
    required bool select,
    required BuildContext context
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return PopupMenuItem<MyMenu>(
      value: menu,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          gradient: select ? AppColors.primaryColor : null,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 24.h,
              width: 24.w,
              color: select ? AppColors.whiteColor :isDark? AppColors.darkAppBar:AppColors.darkPrimary,
            ),
            SizedBox(width: 10.w),
            CustomTextSecondary(
              text: text,
              color: select ? AppColors.whiteColor :isDark? AppColors.darkAppBar: AppColors.darkContainer,
            ),
          ],
        ),
      ),
    );
  }
}
