import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class NotificationItem extends StatelessWidget {
  final String notificationIcon;
  final String notificationText;
  final String notificationTime;
  final VoidCallback onTap;
  final bool isSelect;
  const NotificationItem({
    super.key,
    required this.notificationIcon,
    required this.notificationText,
    required this.notificationTime, required this.onTap, required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
  

    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 15.88.h),
          width: MediaQuery.widthOf(context),
          height: 105.h,
          decoration: BoxDecoration(
            color: isSelect
                ? Color(0xFFF0E6EC)
                : null,
            borderRadius: BorderRadius.circular(
              isSelect ? 8.sp : 0.sp,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 49.62.h,
                width: 49.62.w,
                decoration: BoxDecoration(
                  color: isSelect
                      ? Color(0xFFD1B1C5)
                      : Color(0xFFF0E6EC),
                  borderRadius: BorderRadius.circular(99.sp),
                ),
                child: Center(
                  child: Image.asset(
                    notificationIcon,
                    height: 23.82.h,
                    width: 23.82.w,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.primaryText(
                    text: notificationText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText.primaryText(
                    text: notificationTime,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6F6F6F),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
