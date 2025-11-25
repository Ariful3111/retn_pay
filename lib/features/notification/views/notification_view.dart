import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/notification/controller/notification_controller.dart';
import 'package:renter_pay/features/notification/widgets/notification_appbar_actions.dart';
import 'package:renter_pay/features/notification/widgets/notification_item.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 10.w),
              CustomAppbar(title: 'Notification'),
              Spacer(),
              NotificationAppbarActions(),
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextPrimary(text: 'Today', fontSize: 20.sp),
          SizedBox(height: 16.h),
          ListView.builder(
            itemCount: notificationController.iconList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Obx(() {
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
          CustomTextPrimary(text: 'Yesterday', fontSize: 20.sp),
          ListView.builder(
            itemCount: notificationController.iconList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Obx(() {
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
