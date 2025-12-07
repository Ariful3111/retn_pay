import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/features/chat/widgets/user_message.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListView.builder(
      controller: chatController.scrollController,
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.messageView);
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
              color:isDark? AppColors.darkPrimary:Color(0xFFF8F6FF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserMessage(padding: EdgeInsets.zero),
                Spacer(),
                Column(
                  children: [
                    CustomTextSecondary(
                      text: '2m',
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
                          text: '3',
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
  }
}
