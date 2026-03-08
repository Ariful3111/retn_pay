import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/widgets/active_chat.dart';
import 'package:renter_pay/features/chat/widgets/p2p_chat_list.dart';
import 'package:renter_pay/features/chat/widgets/search_chat.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPrimary(
                text: 'Message',
                fontSize: 20.sp,
                color: isDark
                    ? AppColors.darkAppBar
                    : AppColors.primaryTextColor,
              ),
              CustomNotificationButton(),
            ],
          ),
          SizedBox(height: 20.h),
          MediaQuery(
            data: MediaQueryData(
              size: Size(
                MediaQuery.widthOf(context),
                MediaQuery.heightOf(context),
              ),
            ),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSecondary
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    ActiveChat(),
                    SizedBox(height: 10.h),
                    SearchChat(),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return controller.selectItem.value == 0
                          ? Expanded(child: P2PChatList())
                          : Container();
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
