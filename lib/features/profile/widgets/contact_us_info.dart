import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ContactUsInfo extends StatelessWidget {
  const ContactUsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    List iconList = <String>[
      IconsPath.call,
      IconsPath.email,
      IconsPath.web,
      IconsPath.contactLocation,
    ];
    List infoList = <String>[
      '+61 0455 67',
      'info@renterpay.com',
      'www.renterpay.com',
      '14 Headingley Grove, Strathtulloh VIC 3338;\n3702/200 Spencer St, Melbourne VIC 3000;\n15 Gertrude St, Lower Templestowe VIC\n3107; 32 Caithness Cres, Glen Waverly VIC\n3150; 85 Station St, Burwood VIC 3125;',
    ];
    List contactIcon = [
      IconsPath.facebook,
      IconsPath.instagram,
      IconsPath.tiktok,
      IconsPath.youtube,
    ];
    return Container(
      padding: EdgeInsets.only(top: 31.h, left: 31.w),
      height: 513.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(ImagesPath.contactUsBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Contact Information',
            fontSize: 24.sp,
            color: Color(0xFFFAFBFB),
          ),
          SizedBox(height: 12.h),
          CustomTextSecondary(
            text:
                'Whether you\'re a landlord, tenant, or\nservicevendor, we\'re here to assist and\nanswer any questions you might have.\nLet\'s start the conversation!',
            color: AppColors.darkSecondaryText,
          ),
          SizedBox(height: 40.h),
          ...List.generate(iconList.length, (index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      iconList[index],
                      height: 19.06.h,
                      width: 19.06.w,
                    ),
                    SizedBox(width: 9.53.w),
                    CustomTextSecondary(
                      text: infoList[index],
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
                SizedBox(height: 19.06.h),
              ],
            );
          }),
          SizedBox(height: 22.71.h,),
          Row(
            children:List.generate(contactIcon.length, (index) {
            return GestureDetector(
              onTap: () {
                
              },
              child: Container(
                height: 31.77.h,
                width: 31.77,
                margin: EdgeInsets.only(right: 12.71.w,),
                child: Image.asset(contactIcon[index],),
              ),
            );
          }), 
          ),
          
        ],
      ),
    );
  }
}
