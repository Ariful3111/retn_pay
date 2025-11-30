import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';

class RepairPhoto extends StatelessWidget {
  const RepairPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    return Obx(()=> Row(
      children: [
        GestureDetector(
          onTap: () {
            UploadImage.pickMultipleImage(
              allImages: dashboardController.repairImages,
            );
          },
          child: Container(
            height: 57.h,
            width: 57.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.39.r),
              border: Border.all(width: 1.1.r, color:isDark?AppColors.darkBorderPrimary :AppColors.darkLightText),
              color:isDark? AppColors.darkSecondary:AppColors.whiteColor,
            ),
            child: Center(
              child: Image.asset(
                IconsPath.upload,
                height: 26.37.h,
                width: 26.37.w,
                color: isDark?AppColors.darkAppBar:null,
              ),
            ),
          ),
        ),
        SizedBox(width: 13.w),
        Expanded(
          child: SizedBox(
            height: 57.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dashboardController.repairImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 13.w),
                  height: 57.h,
                  width: 57.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.39.r),
                    image: DecorationImage(
                      image: FileImage(File(dashboardController.repairImages[index])),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),);
  }
}
