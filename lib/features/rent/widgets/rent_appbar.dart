import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
import 'package:renter_pay/shared/widgets/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RentAppbar extends StatelessWidget {
  const RentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    RentController rentController = Get.find();
    return CustomAppbar(
      title: "Property",
      image: IconsPath.appbarBack,
      imageHeight: 21.5,
      imageWidth: 21.5,
      onTap: () {},
      secondaryWidget: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(5.sp),
                border: Border.all(width: 1.sp, color: AppColors.primaryBorder),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1.03.sp),
                    blurRadius: 2.07.sp,
                    spreadRadius: 0,
                    color: Color(0xFF525866).withValues(alpha: 0.06),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  IconsPath.favorite,
                  height: 15.h,
                  width: 17.w,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Stack(
                    children: [
                      Positioned(
                        right: 20.w,
                        top: 20.h,
                        child: Obx(() {
                          final start = rentController.range.value.start;
                          final end = rentController.range.value.end;
                          return CustomFilter(
                            range: rentController.range.value,
                            min: '\$${start.toInt().toString()}',
                            max: '\$${end.toInt().toString()}',
                            minRange: rentController.minRange,
                            maxRange: rentController.maxRange,
                            onChanged: (SfRangeValues value) {
                              rentController.range.value = value;
                            }, textEditingController: rentController.filterSearchController, isSlider: () {  }, isSearch: () {  },
                          );
                        }),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 32.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(5.5.sp),
                border: Border.all(
                  width: 0.88.sp,
                  color: AppColors.primaryBorder,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0.88.sp),
                    blurRadius: 1.76.sp,
                    spreadRadius: 0,
                    color: Color(0xFF525866).withValues(alpha: 0.06),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.secondaryText(text: 'Filter', fontSize: 12.sp),
                  SizedBox(width: 8.h),
                  Image.asset(IconsPath.filter, height: 14.h, width: 14.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
