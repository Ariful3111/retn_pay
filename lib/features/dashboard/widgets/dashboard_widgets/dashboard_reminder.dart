import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/reminder_controller.dart';
import 'package:renter_pay/shared/widgets/custom_reminder.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';

class DashboardReminder extends GetWidget<ReminderController> {
  const DashboardReminder({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      double containerHeight = 0.0;
      double contentHeight = 0.0;
      if (controller.reminders.value?.data?.data?.isNotEmpty ?? false) {
        double itemHeight = 146.h;
        int itemCount = controller.reminders.value?.data?.data?.length ?? 0;
        contentHeight = itemCount * itemHeight + 60.h;
        containerHeight = contentHeight > 513.h ? 513.h : contentHeight;
      }

      return controller.isLoading.value
          ? ButtonLoading()
          : controller.reminders.value?.data?.data?.isEmpty ?? true
          ? SizedBox()
          : AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: containerHeight,
                padding: EdgeInsets.symmetric(
                  horizontal: 13.07.w,
                  vertical: 21.79.h,
                ),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: CustomTextPrimary(
                        text: 'Reminders',
                        fontSize: 20.sp,
                        color: isDark
                            ? AppColors.darkAppBar
                            : AppColors.primaryColorDark,
                      ),
                    ),
                    Divider(
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.whiteBorder,
                      thickness: 1,
                    ),
                    SizedBox(height: 13.07.h),
                    Flexible(
                      child: ListView.builder(
                        physics: contentHeight > 513.h
                            ? AlwaysScrollableScrollPhysics()
                            : NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.reminders.value?.data?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item =
                              controller.reminders.value?.data?.data?[index];
                          return Dismissible(
                            key: ValueKey(item.hashCode),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) async {},
                            child: CustomReminder(
                              title: item?.data?.title ?? '',
                              date: (item?.createdAt).toMMMddyyyyHmmaa(),
                              detail: item?.data?.body ?? '',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
