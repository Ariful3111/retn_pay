import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class PropertyOwnerDocumentImage extends StatelessWidget {
  final VoidCallback onPickImage;
  final String image;
  final String imageName;
  final VoidCallback onUpload;
  final VoidCallback onOkImage;
  final VoidCallback onRemoveImage;
  const PropertyOwnerDocumentImage({super.key, required this.onPickImage, required this.image, required this.imageName, required this.onUpload, required this.onOkImage, required this.onRemoveImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: onPickImage,
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: Radius.circular(20.sp),
                borderPadding: EdgeInsets.all(1.r),
                color: AppColors.lightBorder,
                dashPattern: [3, 3],
              ),
              child: SizedBox(
                width: MediaQuery.widthOf(context),
                height: 175.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsPath.document, height: 32.h, width: 32.w),
                    SizedBox(height: 8.h),
                    CustomTextSpan(
                      title: "Tap Here To Upload",
                      spantext: "\nYour Document",
                      fontSize: 16.sp,
                      spanFontSize: 16.sp,
                      spanColor: AppColors.primaryColorDark,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          ...List.generate(2, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.r,
                        color: AppColors.lightBorder,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(image: AssetImage(image)),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomTextSecondary(
                    text: imageName,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: onOkImage,
                    child: Image.asset(
                      IconsPath.take,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    onTap: onRemoveImage,
                    child: Image.asset(
                      IconsPath.remove,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }
}