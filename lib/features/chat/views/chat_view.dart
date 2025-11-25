import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/chat/widgets/active_chat.dart';
import 'package:renter_pay/features/chat/widgets/chat_list.dart';
import 'package:renter_pay/features/chat/widgets/search_chat.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalScrollController globalScrollController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
      gradient: AppColors.userBackground.withOpacity(0.5),
      child: ListView(
        controller: globalScrollController.scrollController,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPrimary(text: 'Message',fontSize: 20.sp,color: AppColors.primaryTextColor,),
              CustomNotificationButton(),
            ],
          ),
          SizedBox(height: 20.h,),
          MediaQuery(
            data: MediaQueryData(
              size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context))
            ),
            child: Container(
              padding: EdgeInsets.only(top: 30.h,left: 30.w,right: 30.w),
              // height: MediaQuery.heightOf(context),
              // width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: Column(
                children: [
                  ActiveChat(),
                  SizedBox(height: 10.h,),
                  SearchChat(),
                  SizedBox(height: 10.h,),
                  ChatList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}