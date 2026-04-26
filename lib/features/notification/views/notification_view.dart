import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/notification/controller/notification_controller.dart';
import 'package:renter_pay/features/notification/widgets/notification_appbar_actions.dart';
import 'package:renter_pay/features/notification/widgets/notification_item.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Obx(() {
        return controller.isLoading.value
            ? Center(child: ButtonLoading())
            : ListView(
                controller: controller.scrollController,
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
                  ...controller.notificationSections.expand(
                    (section) => [
                      SizedBox(height: 20.h),
                      CustomTextPrimary(text: section.title, fontSize: 20.sp),
                      SizedBox(height: 16.h),
                      ...section.items.map(
                        (item) => NotificationItem(
                          notificationIcon: controller.iconList[0],
                          notificationText: (item.data?.title ?? '').isNotEmpty
                              ? item.data?.title ?? ''
                              : item.data?.body ?? '',
                          notificationTime: (item.createdAt).toTimeAgo(),
                          onTap: () {
                            if (item.type == "property") {
                              Get.toNamed(
                                AppRoutes.rentDetails,
                                arguments: item.data?.data?.propertyId,
                              );
                            } else if (item.type == "support") {
                              Get.toNamed(AppRoutes.supportView);
                            } else if (item.type == "chat") {
                              Get.toNamed(
                                AppRoutes.messageView,
                                arguments: {
                                  "ID": item.data?.data?.chatConversationId,
                                },
                              );
                            }
                          },
                          isSelect: item.isRead == false,
                        ),
                      ),
                    ],
                  ),
                  if (controller.isLoadingMore.value) ButtonLoading(),
                ],
              );
      }),
    );
  }
}
