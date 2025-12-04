import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyDetailsList extends StatelessWidget {
  const PropertyDetailsList({super.key,});

  @override
  Widget build(BuildContext context) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
    List detailsList = <String>[
      'Open floor plan with natural lighting',
      'Fully equipped modern kitchen',
      'Large balcony with scenic views',
      'Gated community with 24/7 security',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: 'Experience modern living with high-end finishes, including wood-style flooring, sleek Whirlpool stainless steel appliances, and premium amenities designed for comfort and convenience. Enjoy a sophisticated urban lifestyle in a prime location with easy access to dining, entertainment, and business hubs.',
        color:isDark?AppColors.darkSecondaryText.withValues(alpha: 0.5) :AppColors.darkPrimary.withValues(alpha: 0.5),
        ),
        SizedBox(height: 12.h,),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: detailsList.length,
          itemBuilder: (context,index){
          return SizedBox(
          height: 27.h,
          child: Row(
            children: [
              Image.asset(IconsPath.propertyCheck,height: 15.h,width: 15.w,color: isDark?AppColors.whiteColor:null,),
              SizedBox(width: 8.w,),
              CustomTextPrimary(text: detailsList[index],fontSize: 16.sp,fontWeight: FontWeight.w500,),
            ],
          ),
        );
        }),
      ],
    );
  }
}