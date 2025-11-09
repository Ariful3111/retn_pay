import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/auth/controllers/onboarding_controller.dart';

class OnboardingSlider extends StatelessWidget {
  const OnboardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.find();

    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(4, (index) {
              bool isActive = onboardingController.currentPage.value == index;
              return AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 6.w,
                width: isActive ? 24.w : 14.w,
                decoration: BoxDecoration(
                  gradient: isActive
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              );
            }),
          ),

          GestureDetector(
            onTap: () {
              onboardingController.nextPage();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.linearToEaseOut,
              height: onboardingController.currentPage.value == 3 ? 60.h : 52.h,
              width: onboardingController.currentPage.value == 3 ? 106.w : 52.w,
              decoration: BoxDecoration(
                gradient: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: onboardingController.currentPage.value == 3
                  ? Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) =>
                            onboardingController.updateDrag(details.delta.dx),
                        onHorizontalDragEnd: (_) =>
                            onboardingController.endDrag(),
                        child: Row(
                          children: [
                            FadeIn(
                              delay: Duration(milliseconds: 500),
                              child: Transform.translate(
                                offset: Offset(
                                  onboardingController.dragOffset.value.w,
                                  0,
                                ),
                                child: Container(
                                  height: 52.h,
                                  width: 52.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      IconsPath.onboardingHome,
                                      height: 22.h,
                                      width: 22.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            ...List.generate(3, (index) {
                              return FadeIn(
                                delay: Duration(
                                  milliseconds: 800 + (index * 200),
                                ),
                                child: onboardingController.dragOffset < 20.w
                                    ? Image.asset(
                                        IconsPath.forwardArrow,
                                        height: 12.h,
                                        width: 8.w,
                                        color: onboardingController.syncColor(
                                          index,
                                        ),
                                      )
                                    : SizedBox(),
                              );
                            }),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        IconsPath.forward,
                        height: 22.h,
                        width: 23.w,
                      ),
                    ),
            ),
          ),
        ],
      );
    });
  }
}
