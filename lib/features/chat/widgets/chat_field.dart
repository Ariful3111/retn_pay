import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class ChatField extends StatelessWidget {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 20.h),
      child: CustomTextField(
        controller: chatController.messageController,
        fillColor:isDark?AppColors.darkPrimary: AppColors.whiteColor,
        enableBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color:isDark?AppColors.darkBorderPrimary: Color(0xFFE3E3E3), width: 1.r),
        ),
        focusBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color:isDark?AppColors.darkBorderPrimary: Color(0xFFE3E3E3), width: 1.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color:isDark?AppColors.darkBorderPrimary: Color(0xFFE3E3E3), width: 1.r),
        ),
        labelTextWidget: CustomTextPrimary(
          text: 'Write a reply...',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFFBBBBBB),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: SizedBox(
          width: 67.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  UploadImage.sendImage(
                    picker: chatController.sendImage,
                    pickImage: chatController.selectImage,
                  );
                },
                child: Image.asset(
                  IconsPath.sendImage,
                  height: 18.h,
                  width: 18.w,
                ),
              ),
              SizedBox(width: 13.w),
              GestureDetector(
                onTap: () {
                  
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
        ),
      ),
    );
  }
}
