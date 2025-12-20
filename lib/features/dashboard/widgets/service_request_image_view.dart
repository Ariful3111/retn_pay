import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';

class ServiceRequestImageView extends StatelessWidget {
  const ServiceRequestImageView({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    return Expanded(
          child: SizedBox(
            height: 52.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: serviceSearchController.uploadedImage.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Container(
                    margin: EdgeInsets.only(right: 10.w),
                    height: 52.h,
                    width: 52.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: FileImage(
                          File(serviceSearchController.uploadedImage[index]),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
  }
}