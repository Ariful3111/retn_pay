import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyKeyFeatures extends StatelessWidget {
  const PropertyKeyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List featureIcon = <String>[
      IconsPath.swimming,
      IconsPath.gym,
      IconsPath.homeGarden,
      IconsPath.carParking,
      IconsPath.security,
      IconsPath.store,
      IconsPath.school,
      IconsPath.restaurant,
      IconsPath.ac,
      IconsPath.pet,
    ];
    List featureTitle = <String>[
      'Swimming Pool',
      'Gym & Fitness Center',
      'Garden & Outdoor Space',
      'Private Parking',
      '24/7 Security',
      'Nearby Shopping ',
      'Close to Schools',
      'Nearby Restaurants',
      'AC Facilities',
      'Pet Allowance',
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: featureTitle.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          height: 48.h,
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.8.r),
            color:isDark? AppColors.primaryTextColor:AppColors.darkAppBar,
          ),
          child: Row(
            children: [
              Image.asset(featureIcon[index], height: 20.h, width: 20.w,color: isDark?AppColors.darkAppBar:null,),
              SizedBox(width: 9.75.w),
              CustomTextSecondary(
                text: featureTitle[index],
                color:isDark? AppColors.darkAppBar:AppColors.primaryTextColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
