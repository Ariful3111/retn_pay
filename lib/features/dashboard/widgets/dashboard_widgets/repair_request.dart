import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_add_multi_image.dart';
import 'package:renter_pay/features/dashboard/widgets/request_form.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RepairRequest extends StatelessWidget {
  const RepairRequest({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
        DashboardController dashboardController = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 24.h),
      height: 412.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color:isDark? AppColors.darkPrimary:AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: CustomTextPrimary(text: 'Submit a Repair Request',fontSize: 24.sp,color:isDark? AppColors.darkAppBar:AppColors.primaryColorDark,)),
          SizedBox(height: 18.h,),
          RequestForm(),
          SizedBox(height: 8.79.h,),
          CustomTextSecondary(text: 'Attach Photos',color:isDark? AppColors.darkSecondaryText:AppColors.darkContainer,),
          SizedBox(height: 8.79.h,),
          CustomAddMultiImage(buttonHeight: 57.h, buttonWidth: 57.w, sizedBoxHeight: 57.h, imageHeight: 57.h, imageWidth: 57.w, onTap: () { 
            UploadImage.pickMultipleImage(
                allImages: dashboardController.repairImages,
              );
           }, item: dashboardController.repairImages.length, imagesPath: dashboardController.repairImages, iconHeight: 26.37.h, iconWidth: 26.37.w,),
          SizedBox(height: 13.18.h,),
          CustomPrimaryButton(height: 54.h, onPressed: () {
          },
          text: 'Submit Repair Request',
          )
        ],
      ),
    );
  }
}