import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/add_repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_service.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairRequestImages extends StatelessWidget {
  const RepairRequestImages({super.key});

  @override
  Widget build(BuildContext context) {
    AddRepairRequestController addRepairRequestController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: 'Attached Photos', fontSize: 20.sp),
        SizedBox(height: 12.h),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: addRepairRequestController.repairImages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 6.w),
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: FileImage(
                      File(addRepairRequestController.repairImages[index]),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
        RepairRequestService(),
      ],
    );
  }
}
