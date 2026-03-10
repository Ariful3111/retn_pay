import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/chat/controllers/message_controller.dart';
import 'package:renter_pay/features/chat/controllers/send_message_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ChatField extends GetWidget<SendMessageController> {
  final int conversationID;
  const ChatField({super.key, required this.conversationID});

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 20.h),
      child: CustomTextField(
        controller: messageController.messageController,
        fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        enableBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkBorderPrimary : Color(0xFFE3E3E3),
            width: 1.r,
          ),
        ),
        focusBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkBorderPrimary : Color(0xFFE3E3E3),
            width: 1.r,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkBorderPrimary : Color(0xFFE3E3E3),
            width: 1.r,
          ),
        ),
        labelTextWidget: CustomTextPrimary(
          text: 'Write a reply...',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFFBBBBBB),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: Obx(() {
          final isLoading = controller.isLoading.value;
          return SizedBox(
            width: isLoading ? 96.w : 67.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    UploadImage.sendImage(
                      picker: messageController.sendImage,
                      pickImage: messageController.selectImage,
                      context: context,
                    );
                  },
                  child: Image.asset(
                    IconsPath.sendImage,
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
                SizedBox(width: 13.w),
                isLoading
                    ? ButtonLoading(loadingSize: 15.sp)
                    : GestureDetector(
                        onTap: () async {
                          await controller.sendMessage(
                            conversationID: conversationID,
                            message: messageController.messageController.text,
                          );
                          messageController.messageController.clear();
                        },
                        child: Image.asset(
                          IconsPath.sendMessage,
                          height: 18.h,
                          width: 18.w,
                        ),
                      ),
                SizedBox(width: 18.w),
              ],
            ),
          );
        }),
      ),
    );
  }
}
