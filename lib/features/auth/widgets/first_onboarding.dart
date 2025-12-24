import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/first_onboarding_controller.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    FirstOnboardingController firstOnboardingController = Get.find();

    return GestureDetector(
      onPanDown: (_) {
        firstOnboardingController.paused();
      },
      onPanCancel: firstOnboardingController.resume,
      onPanEnd: (_) {
        firstOnboardingController.resume();
      },
      onTapDown: (_) {
        firstOnboardingController.paused();
      },
      onTapUp: (_) {
        firstOnboardingController.resume();
      },
      child: SizedBox(
        height: 612.h,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(firstOnboardingController.crossAxis, (
              colIndex,
            ) {
              return SizedBox(
                width: 150.w,
                child: ListView.builder(
                  controller:
                      firstOnboardingController.columnController[colIndex],
                  physics: const NeverScrollableScrollPhysics(),
                  // Use a large number to simulate infinite scrolling or null for truly infinite
                  // However, for performance and simplicity with jumpTo logic, we can just use null (infinite)
                  // But we need to ensure the index wraps around.
                  itemBuilder: (context, i) {
                    final List<String> currentColumn =
                        firstOnboardingController.columns[colIndex];
                    // Use modulo to loop the list
                    final String image =
                        currentColumn[i % currentColumn.length];
                    return onboardingContainer(image);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget onboardingContainer(String image) {
    return Container(
      margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
      height: 200.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
