import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomAttachImageView extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final double? sizeHeight;
  final double? radius;
  final RxList<XFile> imageList;
  const CustomAttachImageView({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.radius,
    this.sizeHeight,
    required this.imageList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => SizedBox(
          height: sizeHeight ?? 52.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: padding ?? 10.w),
                height: height ?? 52.h,
                width: width ?? 52.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 8.r),
                  image: DecorationImage(
                    image: FileImage(File(imageList[index].path)),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
