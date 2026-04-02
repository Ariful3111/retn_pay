import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
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
        color: isDark ? AppColors.darkPrimary : Color(0xFFF2EEFC),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.25.r,
          color: isDark ? AppColors.darkBorderPrimary : Color(0xFFDBDCDF),
        ),
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(chatController.item.length, (i) {
            final select = chatController.selectItem.value == i;
            final item = chatController.item[i];
            return GestureDetector(
              onTap: () {
                chatController.selectItem.value = i;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                height: 50.h,
                width: 136.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: select ? AppColors.primaryColor : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      item['icon'],
                      height: item == 0 ? 30.h : 20.h,
                      width: item == 0 ? 30.w : 20.h,
                      color: select
                          ? AppColors.whiteColor
                          : AppColors.primaryColorDark,
                    ),
                    CustomTextSecondary(
                      text: item['text'],
                      fontSize: 20.sp,
                      color: select ? AppColors.whiteColor : null,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
