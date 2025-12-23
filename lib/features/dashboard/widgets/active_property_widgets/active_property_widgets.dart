import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/active_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ActivePropertyWidgets extends StatelessWidget {
  const ActivePropertyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ActivePropertyController controller = Get.find();
    return Obx(
      () => Column(
        children: List.generate(controller.title.length, (index) {
          final isSelected = controller.isOpenList[index];
          return Column(
            key: ValueKey(index),
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSecondary
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextPrimary(
                          text: controller.title[index],
                          fontSize: 16.sp,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.secondaryTextColor,
                        ),
                        InkWell(
                          onTap: () {
                            controller.isOpenList[index] =
                                !controller.isOpenList[index];
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Center(
                              child: Image.asset(
                                isSelected
                                    ? IconsPath.upArrow
                                    : IconsPath.downArrow,
                                color: isDark
                                    ? AppColors.whiteColor
                                    : AppColors.secondaryTextColor,
                                height: 7.5.h,
                                width: 15.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: isSelected
                          ? Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: controller.widgetList[index],
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }
}
