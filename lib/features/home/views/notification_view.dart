import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/notification_controller.dart';
import 'package:renter_pay/features/home/widgets/notification_appbar.dart';
import 'package:renter_pay/features/home/widgets/notification_item.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController = Get.find();

    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          NotificationAppbar(),
          SizedBox(height: 20.h),
          CustomText.primaryText(text: 'Today', fontSize: 20.sp),
          SizedBox(height: 16.h),
          ListView.builder(
            itemCount: notificationController.iconList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Obx((){
                bool selectItem =
                  notificationController.isSelected.value == index;
                return NotificationItem(
                notificationIcon: notificationController.iconList[index],
                notificationText: notificationController.textList[index],
                notificationTime: notificationController.timeList[index],
                onTap: () {
                  notificationController.selectItem(index);
                },
                isSelect: selectItem,
              );
              });
            },
          ),
          CustomText.primaryText(text: 'Yesterday', fontSize: 20.sp),
          ListView.builder(
            itemCount: notificationController.iconList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Obx((){
                bool selectItem =
                  notificationController.isSelected.value == index;
                return NotificationItem(
                notificationIcon: notificationController.iconList[index],
                notificationText: notificationController.textList[index],
                notificationTime: notificationController.timeList[index],
                onTap: () {
                  notificationController.selectItem(index);
                },
                isSelect: selectItem,
              );
              });
            },
          ),
        ],
      ),
    );
  }
}
