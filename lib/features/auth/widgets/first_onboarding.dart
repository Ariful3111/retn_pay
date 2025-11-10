import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/auth/controllers/first_onboarding_controller.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    FirstOnboardingController firstOnboardingController = Get.find();
    List imageList = [
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

    final int rowCount =
        (imageList.length / firstOnboardingController.crossAxis).ceil();

    final List<List<String>> columns = List.generate(
      firstOnboardingController.crossAxis,
      (colIndex) {
        return List.generate(rowCount, (rowIndex) {
          int index = rowIndex * firstOnboardingController.crossAxis + colIndex;
          return index < imageList.length ? imageList[index] : null;
        }).whereType<String>().toList();
      },
    );
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
        height: 566.h,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(columns.length, (colIndex) {
              return SizedBox(
                width: 150.w,
                child: ListView.builder(
                  controller:
                      firstOnboardingController.columnController[colIndex],
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: columns[colIndex].length,
                  itemBuilder: (context, i) {
                    return onboardingContainer(columns[colIndex][i]);
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
      margin: EdgeInsets.only(right: 10.w,bottom: 10.h),
      height: 200.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
