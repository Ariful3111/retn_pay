import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/controllers/websocket_connect_controller.dart';
import 'package:renter_pay/features/chat/widgets/message_body.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class MessageView extends GetView<WebsocketConnectController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 8.w),
              CustomAppbar(title: 'Message'),
              Spacer(),
              CustomNotificationButton(),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              height: MediaQuery.heightOf(context),
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Obx(() {
                return MessageBody(
                  isMe: messageController.isMe.value,
                  controller: messageController.messageScrollController,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
