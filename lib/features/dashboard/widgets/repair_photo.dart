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
    DashboardController dashboardController = Get.find();
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            UploadImage.sendImage(
              picker: dashboardController.picker,
              pickImage: dashboardController.upload,
            );
          },
          child: Container(
            height: 57.h,
            width: 57.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.39.r),
              border: Border.all(width: 1.1.r, color: AppColors.darkLightText),
              color: AppColors.whiteColor,
            ),
            child: Center(
              child: Image.asset(
                IconsPath.upload,
                height: 26.37.h,
                width: 26.37.w,
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
