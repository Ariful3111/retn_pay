import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/controllers/p2p_chat_list_controller.dart';
import 'package:renter_pay/features/chat/models/chat_list_model.dart';
import 'package:renter_pay/features/chat/widgets/user_message.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class P2PChatList extends GetWidget<P2PChatListController> {
  const P2PChatList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : ListView.builder(
              controller: Get.find<ChatController>().scrollController,
              itemCount:
                  (controller.chats.value?.data?.data?.length ?? 0) +
                  (controller.isLoadingMore.value ? 1 : 0),
              itemBuilder: (context, index) {
                final chats = controller.chats.value?.data?.data ?? [];
                if (index >= chats.length) {
                  return const ButtonLoading(verticalPadding: 12);
                }
                ChatConversation chat =
                    controller.chats.value?.data?.data?[index] ??
                    ChatConversation();
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.messageView,
                      arguments: {
                        "channelName": "private-chat.conversation.${chat.id}",
                        "ID": chat.id,
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.25.w,
                      vertical: 11.25.h,
                    ),
                    height: 72.5.h,
                    width: MediaQuery.widthOf(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: isDark ? AppColors.darkPrimary : Color(0xFFF8F6FF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserMessage(
                          padding: EdgeInsets.zero,
                          imageUrl: chat.otherUser?.image ?? '',
                          name: chat.otherUser?.name ?? '',
                          role:
                              chat.otherUser?.roles?.first.capitalizeFirst ??
                              '',
                        ),
                        Spacer(),
                        Column(
                          children: [
                            CustomTextSecondary(
                              text: (chat.lastMessage?.createdAt)
                                  .toShortTimeAgo(),
                              fontSize: 14.sp,
                              color: Color(0xFF99A2AB),
                            ),
                            Container(
                              height: 18.75.h,
                              width: 18.75.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                gradient: AppColors.primaryColor,
                              ),
                              child: Center(
                                child: CustomTextSecondary(
                                  text: chat.messageCount.toString(),
                                  fontSize: 10.sp,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
