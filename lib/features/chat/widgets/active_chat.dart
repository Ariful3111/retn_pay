import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ActiveChat extends StatelessWidget {
  const ActiveChat({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(10.r),
      height: 70.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color:isDark?AppColors.darkPrimary: Color(0xFFF2EEFC),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1.25.r, color:isDark? AppColors.darkBorderPrimary:Color(0xFFDBDCDF)),
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeButton(
              icon: IconsPath.active,
              text: 'Active',
              onTap: () {
                chatController.isActive.value = !chatController.isActive.value;
              },
              gradient: chatController.isActive.value?AppColors.primaryColor:null,
              color: chatController.isActive.value?AppColors.whiteColor:null,
              iconColor: chatController.isActive.value?AppColors.whiteColor:AppColors.primaryColorDark,
            ),
            activeButton(
              icon: IconsPath.archive,
              text: 'Archive',
              onTap: () {
                chatController.isActive.value = !chatController.isActive.value;
              },
              iconHeight: 20.h,
              iconWidth: 20.w,
              gradient: chatController.isActive.value?null:AppColors.primaryColor,
              color: chatController.isActive.value?null:AppColors.whiteColor,
              iconColor: chatController.isActive.value?AppColors.primaryColorDark:AppColors.whiteColor,
            ),
          ],
        );
      }),
    );
  }

  Widget activeButton({
    LinearGradient? gradient,
    required String icon,
    required String text,
    Color? color,
    required VoidCallback onTap,
    double? iconHeight,
    double? iconWidth,
    Color ?iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        height: 50.h,
        width: 136.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: gradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              icon,
              height: iconHeight ?? 30.h,
              width: iconWidth ?? 30.w,
              color: iconColor,
            ),
            CustomTextSecondary(text: text, fontSize: 20.sp, color: color),
          ],
        ),
      ),
    );
  }
}
