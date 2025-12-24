import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class FirstOnboardingController extends GetxController
    with GetTickerProviderStateMixin {
  final int crossAxis = 3;
  final List<ScrollController> columnController = [];
  final List<AnimationController> animControllers = [];

  // Data
  late List<String> imageList;
  late List<List<String>> columns;

  RxBool isPaused = false.obs;
  Timer? scrollTimer;

  // Item height + margin (200.h + 10.h)
  double get itemFullHeight => 210.h;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initAnimations();
  }

  void _initData() {
    imageList = [
      ImagesPath.onboarding1,
      ImagesPath.onboarding2,
      ImagesPath.onboarding3,
      ImagesPath.onboarding4,
      ImagesPath.onboarding5,
      ImagesPath.onboarding6,
      ImagesPath.onboarding7,
      ImagesPath.onboarding8,
      ImagesPath.onboarding9,
      ImagesPath.onboarding10,
      ImagesPath.onboarding11,
      ImagesPath.onboarding12,
      ImagesPath.onboarding13,
      ImagesPath.onboarding14,
      ImagesPath.onboarding15,
    ];

    final int rowCount = (imageList.length / crossAxis).ceil();
    columns = List.generate(crossAxis, (colIndex) {
      return List.generate(rowCount, (rowIndex) {
        int index = rowIndex * crossAxis + colIndex;
        return index < imageList.length ? imageList[index] : null;
      }).whereType<String>().toList();
    });
  }

  void _initAnimations() {
    for (int i = 0; i < crossAxis; i++) {
      columnController.add(ScrollController());
      final anim = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 15), // Adjusted for smooth speed
      );
      animControllers.add(anim);
      anim.repeat();
    }

    // Link animations after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      linkAnimation();
    });
  }

  void linkAnimation() {
    for (int i = 0; i < crossAxis; i++) {
      animControllers[i].addListener(() {
        if (isPaused.value) return;

        final controller = columnController[i];
        if (controller.hasClients) {
          final double loopHeight = columns[i].length * itemFullHeight;

          double offset;
          // Center column (index 1): Scroll Down (Content moves down)
          if (i == 1) {
            // Animate from LoopHeight to 0
            offset = (1 - animControllers[i].value) * loopHeight;
          } else {
            // Left & Right columns: Scroll Up (Content moves up)
            // Animate from 0 to LoopHeight
            offset = animControllers[i].value * loopHeight;
          }

          controller.jumpTo(offset);
        }
      });
    }
  }

  void paused() {
    scrollTimer?.cancel();
    if (!isPaused.value) {
      isPaused.value = true;
      for (var c in animControllers) {
        c.stop();
      }
    }
  }

  void resume() {
    scrollTimer?.cancel();
    scrollTimer = Timer(const Duration(milliseconds: 200), () {
      if (isPaused.value) {
        isPaused.value = false;
        for (var c in animControllers) {
          c.repeat();
        }
      }
    });
  }

  @override
  void onClose() {
    scrollTimer?.cancel();
    for (var a in animControllers) {
      a.dispose();
    }
    for (var s in columnController) {
      s.dispose();
    }
    super.onClose();
  }
}
