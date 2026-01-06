import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_image.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyOwnerDocumentUpload extends StatelessWidget {
  final VoidCallback onPickImage;
  final String image;
  final String imageName;
  final VoidCallback onUpload;
  final VoidCallback onOkImage;
  final VoidCallback onRemoveImage;
  const PropertyOwnerDocumentUpload({
    super.key,
    required this.onPickImage,
    required this.image,
    required this.imageName,
    required this.onUpload,
    required this.onOkImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(20.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark
            ? AppColors.darkSecondary
            : AppColors.darkAppBar.withValues(alpha: 0.5),
      ),
      child: Column(
        children: [
          PropertyOwnerDocumentImage(
            onPickImage: onPickImage,
            image: image,
            imageName: imageName,
            onUpload: onUpload,
            onOkImage: onOkImage,
            onRemoveImage: onRemoveImage,
          ),
          SizedBox(height: 12.h),
          CustomPrimaryButton(
            height: 37.h,
            width: 99.w,
            borderRadius: BorderRadius.circular(8.r),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconsPath.upload,
                  height: 18.w,
                  width: 18.w,
                  color: AppColors.darkAppBar,
                ),
                SizedBox(width: 6.w),
                CustomTextSecondary(
                  text: 'Upload',
                  fontSize: 14.sp,
                  color: AppColors.darkAppBar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
