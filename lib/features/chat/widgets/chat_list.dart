import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
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
              color: Color(0xFFF8F6FF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    image: DecorationImage(image: AssetImage(ImagesPath.profile),fit: BoxFit.fill)
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 6.h,right: 6.w),
                      height: 7.5.h,
                      width: 7.5.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Color(0xFF65C18C)
                      ),
                    ),
                  )),
                SizedBox(width: 8.75.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPrimary(text: 'Ariful Islam', fontSize: 16.sp),
                    CustomTextSecondary(
                      text: 'Landlord',
                      fontSize: 14.sp,
                      color: Color(0xFF99A2AB),
                    ),
                  ],
                ),
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
