import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyKeyFeatures extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const PropertyKeyFeatures({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final amenities = propertyDetails.data?.amenities ?? [];

    final features = amenities
        .map((amenity) => amenityMap[amenity.amenityType])
        .where((info) => info != null)
        .toList();

    if (features.isEmpty) {
      return SizedBox();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          height: 48.h,
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.8.r),
            color: isDark ? AppColors.primaryTextColor : AppColors.darkAppBar,
          ),
          child: Row(
            children: [
              Image.asset(
                feature!['icon'],
                height: 20.h,
                width: 20.w,
                color: isDark ? AppColors.darkAppBar : null,
              ),
              SizedBox(width: 9.75.w),
              CustomTextSecondary(
                text: feature['title'],
                color: isDark
                    ? AppColors.darkAppBar
                    : AppColors.primaryTextColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
