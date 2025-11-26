import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/chat/controllers/chat_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class SearchChat extends StatelessWidget {
  const SearchChat({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.25),
            blurRadius: 2.5,
            color: Color(0xFF091948).withValues(alpha: 0.06),
          ),
        ],
      ),
      child: CustomTextField(
        controller: chatController.searchController,
        fillColor:isDark?AppColors.darkPrimary: AppColors.whiteColor,
        labelTextWidget: CustomTextSecondary(text: 'Search...',fontSize: 17.5.sp,fontWeight: FontWeight.w400,color:isDark? AppColors.darkSecondaryText:Color(0xFF424242),),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 12.5.w),
          child: Image.asset(IconsPath.homeSearch,height: 25.h,width: 25.w,color:isDark?AppColors.darkSecondaryText: Color(0xFF424242),),
        ),
        enableBorder: OutlineInputBorder(
          borderSide: BorderSide(color:isDark?AppColors.darkBorderPrimary: Color(0xFFE9E9E9),width: 1.25.r),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusBorder: OutlineInputBorder(
          borderSide: BorderSide(color:isDark?AppColors.darkBorderPrimary: Color(0xFFE9E9E9),width: 1.25.r),
          borderRadius: BorderRadius.circular(10.r),
        ),
        ),

    );
  }
}
