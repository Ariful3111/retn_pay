import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomAddMultiImage extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final double sizedBoxHeight;
  final double imageHeight;
  final double imageWidth;
  final double iconHeight;
  final double iconWidth;
  final double? borderWidth;
  final double? borderRadius;
  final double? imageRadius;
  final VoidCallback onTap;
  final int item;
  final List<String> imagesPath;
  final double? sizedBox;
  final double? margin;
  const CustomAddMultiImage({
    super.key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.sizedBoxHeight,
    required this.imageHeight,
    required this.imageWidth,
    required this.onTap,
    required this.item,
    required this.imagesPath,
    required this.iconHeight,
    required this.iconWidth,
    this.borderWidth,
    this.borderRadius,
    this.sizedBox, this.margin, this.imageRadius,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 4.39.r),
              border: Border.all(
                width: borderWidth ?? 1.1.r,
                color: isDark
                    ? AppColors.darkBorderPrimary
                    : AppColors.darkLightText,
              ),
              color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
            ),
            child: Center(
              child: Image.asset(
                IconsPath.upload,
                height: iconHeight,
                width: iconWidth,
                color: isDark ? AppColors.darkAppBar : null,
              ),
            ),
          ),
        ),
         SizedBox(width:sizedBox ?? 13.w),
        Expanded(
          child: SizedBox(
            height: sizedBoxHeight,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: item,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right:margin?? 13.w),
                  height: imageHeight,
                  width: imageWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(imageRadius?? 4.39.r),
                    image: DecorationImage(
                      image: FileImage(File(imagesPath[index])),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
