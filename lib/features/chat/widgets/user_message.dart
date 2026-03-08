import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UserMessage extends StatelessWidget {
  final double? imageHeight;
  final double? imageWidth;
  final double? titleSize;
  final double? subtitleSize;
  final double? spaceWidth;
  final EdgeInsets padding;
  final String imageUrl;
  final String name;
  final String role;
  const UserMessage({
    super.key,
    this.imageHeight,
    this.imageWidth,
    this.titleSize,
    this.subtitleSize,
    this.spaceWidth,
    required this.padding,
    required this.imageUrl,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: padding,
          child: Container(
            height: imageHeight ?? 50,
            width: imageWidth ?? 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage(ImagesPath.profile),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 6.h, right: 6.w),
                height: 7.5.h,
                width: 7.5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Color(0xFF65C18C),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: spaceWidth ?? 8.75.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPrimary(text: name, fontSize: titleSize ?? 16.sp),
            CustomTextSecondary(
              text: role,
              fontSize: subtitleSize ?? 14.sp,
              color: Color(0xFF99A2AB),
            ),
          ],
        ),
      ],
    );
  }
}
