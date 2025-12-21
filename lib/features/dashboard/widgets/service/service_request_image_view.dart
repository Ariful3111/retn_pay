import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';

class ServiceRequestImageView extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final double? sizeHeight;
  final double? radius;
  const ServiceRequestImageView({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.radius, this.sizeHeight,
  });

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    return Expanded(
      child: SizedBox(
        height:sizeHeight?? 52.h,
        child:Obx(()=> ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: serviceSearchController.uploadedImage.length,
          itemBuilder: (context, index) {
            return  Container(
                margin: EdgeInsets.only(right: padding ?? 10.w),
                height: height ?? 52.h,
                width: width ?? 52.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 8.r),
                  image: DecorationImage(
                    image: FileImage(
                      File(serviceSearchController.uploadedImage[index]),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
            );
          },
        ),),
      ),
    );
  }
}
