import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attach_image_view.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload_button.dart';

class CustomAttachedImage extends StatelessWidget {
  final RxList<XFile> imageList;
  final double? height;
  final double? width;
  final double? verticalPadding;
  const CustomAttachedImage({super.key, required this.imageList, this.height, this.width, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            await UploadImage.pickMultipleImage(allImages: imageList);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical:verticalPadding?? 10.5.h, horizontal: 12.w),
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(width: 1.w, color: AppColors.secondaryBorder),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  color: AppColors.dropShadowColorSecondary.withValues(
                    alpha: 0.24,
                  ),
                ),
              ],
            ),
            child: Row(
              children: [
                DocumentUploadButton(
                  height: 32.h,
                  width: 32.w,
                  borderColor: AppColors.darkLightText,
                  borderWidth: 0.7.r,
                  radius: 2.7.r,
                  iconHeight: 13.86.h,
                  iconWidth: 11.74.w,
                ),
                SizedBox(width: 8.w),
                CustomTextSecondary(
                  text: 'or drag files here.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        CustomAttachImageView(imageList: imageList),
      ],
    );
  }
}
