import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/widgets/chat_field.dart';
import 'package:renter_pay/features/chat/widgets/user_message.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class MessageBody extends GetWidget<MessageController> {
  final ScrollController scrollController;
  final int conversationID;
  const MessageBody({
    super.key,
    required this.scrollController,
    required this.conversationID,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserMessage(
            padding: EdgeInsets.only(left: 23.w, top: 14.h),
            imageHeight: 40.h,
            imageWidth: 40.h,
            titleSize: 13.sp,
            subtitleSize: 11.sp,
            imageUrl: "",
            name: "Renter Pay",
            role: "Tiger",
          ),
          SizedBox(height: 9.h),
          Divider(
            height: 1.h,
            color: isDark
                ? AppColors.secondaryTextColor
                : Color(0xFFDAE6E8).withValues(alpha: 0.8),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: controller.messages.length,
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) {
                final reversedIndex = controller.messages.length - 1 - index;
                final item = controller.messages[reversedIndex];
                final fromMe = item.isSentByMe == true;
                return Padding(
                  padding: EdgeInsets.only(
                    left: fromMe ? 0 : 20.w,
                    bottom: 20.h,
                    right: fromMe ? 20.w : 0,
                  ),
                  child: Row(
                    mainAxisAlignment: fromMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!fromMe)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            image: DecorationImage(
                              image: AssetImage(ImagesPath.profile),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      SizedBox(width: 20.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        width: 264.w,
                        decoration: BoxDecoration(
                          gradient: fromMe
                              ? AppColors.primaryColor
                              : isDark
                              ? LinearGradient(
                                  colors: [
                                    AppColors.darkPrimary,
                                    AppColors.darkPrimary,
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    Color(0xFFF0F1F4),
                                    Color(0xFFF0F1F4),
                                  ],
                                ),
                          borderRadius: fromMe
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                  bottomLeft: Radius.circular(15.r),
                                )
                              : BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                  bottomRight: Radius.circular(15.r),
                                ),
                          border: fromMe
                              ? Border.all(
                                  width: 1.r,
                                  color: isDark
                                      ? Colors.transparent
                                      : Color(
                                          0xFFDAE6E8,
                                        ).withValues(alpha: 0.8),
                                )
                              : Border.all(
                                  width: 1.r,
                                  color: isDark
                                      ? AppColors.darkSecondary
                                      : Colors.transparent,
                                ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((item.message ?? '').trim().isNotEmpty)
                              CustomTextPrimary(
                                text: item.message ?? "",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: fromMe
                                    ? AppColors.whiteColor
                                    : isDark
                                    ? AppColors.whiteColor
                                    : AppColors.primaryDarkTextColor,
                              ),
                            if ((item.images ?? []).isNotEmpty)
                              SizedBox(height: 10.h),
                            ...((item.images ?? []).map((url) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.network(
                                    url,
                                    width: 232.w,
                                    height: 160.h,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox.shrink(),
                                  ),
                                ),
                              );
                            })),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ChatField(conversationID: conversationID),
        ],
      );
    });
  }
}
