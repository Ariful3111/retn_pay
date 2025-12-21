import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_reminder.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class DashboardReminder extends StatelessWidget {
  const DashboardReminder({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();

    return Obx(() {
      double itemHeight = 146.h;
      int itemCount = dashboardController.reminderList.length;
      double contentHeight = itemCount * itemHeight + 60.h;
      double containerHeight = contentHeight > 513.h ? 513.h : contentHeight;

      return dashboardController.reminderList.isEmpty
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
                        itemCount: dashboardController.reminderList.length,
                        itemBuilder: (context, index) {
                          final item = dashboardController.reminderList[index];
                          return Dismissible(
                            key: ValueKey(item.hashCode),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (_) =>
                                dashboardController.reminderList.removeAt(index),
                            child: CustomReminder(
                              title: item['title'],
                              date: item['date'],
                              detail: item['detail'],
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
