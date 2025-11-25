import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/widgets/inspection_request_button.dart';
import 'package:renter_pay/features/rent/widgets/location_info.dart';
import 'package:renter_pay/features/rent/widgets/property_banner.dart';
import 'package:renter_pay/features/rent/widgets/property_customer_review.dart';
import 'package:renter_pay/shared/widgets/property/property_details_list.dart';
import 'package:renter_pay/features/rent/widgets/rent_details_image.dart';
import 'package:renter_pay/shared/widgets/property/property_details_info.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/property/property_key_features.dart';

class RentDetails extends StatelessWidget {
  const RentDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gradient:isDark? LinearGradient(colors: [
        AppColors.darkPrimary,
        AppColors.darkPrimary,
      ]):AppColors.userBackground.withOpacity(0.5),
      child: ListView(
      children: [
        Row(children: [
          CustomTextSecondary(text: 'Rent',color: AppColors.primaryTextColor,fontSize: 20.sp,),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Center(child: Image.asset(IconsPath.forwardArrow,height: 15.h,width: 10.w,color: AppColors.darkPrimary,))),
          CustomTextSecondary(text: 'Maple Grove Garden House',color: AppColors.primaryTextColor,fontSize: 20.sp,),
        ],),
        SizedBox(height: 24.h,),
        RentDetailsImage(),
        SizedBox(height: 16.h,),
        PropertyDetailsInfo(),
        SizedBox(height: 16.h,),
        InspectionRequestButton(),
        SizedBox(height: 20.h,),
        CustomTextSecondary(text: 'Property Details',fontSize: 20.sp,fontWeight: FontWeight.w600,),
        SizedBox(height: 8.h,),
        CustomTextSecondary(text: 'Experience modern living with high-end finishes, including wood-style flooring, sleek Whirlpool stainless steel appliances, and premium amenities designed for comfort and convenience. Enjoy a sophisticated urban lifestyle in a prime location with easy access to dining, entertainment, and business hubs.',
        color: AppColors.darkPrimary.withValues(alpha: 0.5),
        ),
        SizedBox(height: 12.h,),
        PropertyDetailsList(),
        SizedBox(height:20.h),
        CustomTextSecondary(text: 'Key Features & Amenities',fontSize: 20.sp,fontWeight: FontWeight.w600,),
        SizedBox(height: 16.h),
        PropertyKeyFeatures(),
        SizedBox(height: 24.h,),
        CustomTextSecondary(text: 'Location Information',fontSize: 20.sp,color: AppColors.primaryTextColor,),
        SizedBox(height: 8.h,),
        LocationInfo(),
        SizedBox(height: 24.h),
        PropertyCustomerReview(),
        SizedBox(height: 24.h,),
        PropertyBanner(),
        SizedBox(height: 30.h,)
      ],
    ));
  }
}