import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/add_repair_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_add_multi_image.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairRequestImageDate extends StatelessWidget {
  const RepairRequestImageDate({super.key});

  @override
  Widget build(BuildContext context) {
    AddRepairRequestController addRepairRequestController = Get.find();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAddMultiImage(
            buttonHeight: 33.04.h,
            buttonWidth: 33.04.w,
            sizedBoxHeight: 33.04.h,
            imageHeight: 33.04.h,
            imageWidth: 33.04.w,
            onTap: () {
              UploadImage.pickMultipleImage(
                allImages: addRepairRequestController.repairImages,
              );
            },
            item: addRepairRequestController.repairImages.length,
            imagesPath: addRepairRequestController.repairImages, iconHeight: 15.25.h, iconWidth: 15.25.w,
            borderRadius: 2.54.r,
            borderWidth: 0.64.w,
            imageRadius: 2.54.r,
            margin: 7.62.w,
            sizedBox: 7.62.w,
          ),
          SizedBox(height: 10.h,),
          CustomTextPrimary(text: 'Date and Time:',fontSize: 12.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 8.h,),
          SizedBox(
            width: 254.w,
            child: CustomDateField(
              controller: addRepairRequestController.dateController, onTap: () {
              DatePicker.pickDate(
                context: context,
                onDateSelected: (date) {
                  addRepairRequestController.selectedDate.value = date;
                  addRepairRequestController.dateController.text =
                      "${date.day.toString().padLeft(2, '0')}/"
                      "${date.month.toString().padLeft(2, '0')}/"
                      "${date.year}";
                },
              );
            },
            textColor:AppColors.secondaryTextColor,
            ),
          )
        ],
      );
    });
  }
}
