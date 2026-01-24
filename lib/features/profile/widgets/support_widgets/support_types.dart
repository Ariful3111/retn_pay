import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SupportTypes extends StatelessWidget {
  const SupportTypes({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(4.r),
        width: 292.w,
        decoration: BoxDecoration(
          gradient: isDark
              ? AppColors.darkAppIcon
              : LinearGradient(
                  colors: [AppColors.whiteColor, AppColors.whiteColor],
                ),
          borderRadius: BorderRadius.circular(9.63.r),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(supportController.supportType.length, (
              index,
            ) {
              bool isSelect = supportController.selectedIndex.value == index;
              return GestureDetector(
                onTap: () {
                  supportController.selectedIndex.value = index;
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.42.r),
                    color: isSelect ? AppColors.primaryColorDark : null,
                  ),
                  child: Center(
                    child: CustomTextSecondary(
                      text: supportController.supportType[index],
                      fontSize: 14.sp,
                      color: isSelect
                          ? AppColors.whiteColor
                          : isDark
                          ? AppColors.darkPrimary
                          : null,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
