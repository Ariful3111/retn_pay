import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload_button.dart';

class AddNewPropertyUploadImage extends StatelessWidget {
  final double? height;
  final VoidCallback onTap;
  final bool isTitle;
  const AddNewPropertyUploadImage({
    super.key,
    this.height,
    required this.onTap, required this.isTitle,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: height ?? 328.h,
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.primaryBorder,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
         isTitle? CustomTextPrimary(
            text: 'Upload Property Image',
            color:isDark? AppColors.darkPrimaryText:AppColors.primaryTextColor,
            fontSize: 16.sp,
          ):SizedBox.shrink(),
          SizedBox(height:isTitle? 70.h:52.h),
          DocumentUploadButton(onTap: onTap),
          SizedBox(height: 16.h),
          CustomTextSpan(
            title: "Press The Button To Upload",
            spantext: "\nImage",
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            spanFontWeight: FontWeight.w600,
            spanFontSize: 16.sp,
            spanColor: AppColors.primaryColorDark,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
