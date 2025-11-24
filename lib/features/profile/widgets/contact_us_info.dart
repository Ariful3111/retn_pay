import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class ContactUsInfo extends StatelessWidget {
  const ContactUsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 31.h,left: 31.w),
      height: 513.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(image: AssetImage(ImagesPath.contactUsBg),fit: BoxFit.fill)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(text: 'Contact Information',fontSize: 24.sp,color: Color(0xFFFAFBFB),),
          SizedBox(height: 12.h,),
          CustomTextSecondary(text: 'Whether you\'re a landlord, tenant, or\nservicevendor, we\'re here to assist and\nanswer any questions you might have.\nLet\'s start the conversation!',color: AppColors.darkSecondaryText,),
          SizedBox(height: 40.h,),
        ],
      ),
    );
  }
}