import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  RxInt activeArrow = 0.obs;
  RxDouble dragOffset = 0.0.obs;
  final double maxDragDistance = 90;
  List colorList = [
    AppColors.whiteColor,
    AppColors.whiteColor.withValues(alpha: 0.6),
    AppColors.whiteColor.withValues(alpha: 0.3),
  ];

  Color syncColor(int i) {
    int relativeIndex = (i - activeArrow.value) % 3;
    return colorList[relativeIndex];
  }

  @override
  void onInit() {
    super.onInit();
    startArrowAnimation();
  }

  void nextPage() {
    if (currentPage.value < 3) {
      Future.delayed(Duration(milliseconds: 300), () {
        currentPage.value++;
      });
    }
  }

  void startArrowAnimation() {
    Future.delayed(Duration.zero, () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 300));
        activeArrow.value = (activeArrow.value + 1) % 3;
      }
    });
  }

  void updateDrag(double dx) {
    dragOffset.value = (dragOffset.value + dx).clamp(0.0, maxDragDistance);
  }

  void endDrag() {
    if (dragOffset.value > maxDragDistance * 0.8) {
      Future.delayed(const Duration(milliseconds: 200), () {
        Get.delete<OnboardingController>();
        Get.toNamed(AppRoutes.userRole)!.then((_) {
          dragOffset.value = 0.0;
        });
      });
      dragOffset.value = maxDragDistance;
    } else {
      dragOffset.value = 0.0;
    }
  }
}
