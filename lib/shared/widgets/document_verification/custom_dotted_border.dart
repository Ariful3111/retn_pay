import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomDottedBorder extends StatelessWidget {
  final XFile image;
  final double?height;
  final double?width;
  const CustomDottedBorder({super.key, required this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(20.sp),
        borderPadding: EdgeInsets.all(1.r),
        color: AppColors.lightBorder,
        dashPattern: [3, 3],
      ),
      child: Container(
        height: 225.h,
        width: 350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(
            image: FileImage(File(image.path)),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
