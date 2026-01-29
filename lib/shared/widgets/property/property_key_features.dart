import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyKeyFeatures extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const PropertyKeyFeatures({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final amenities = propertyDetails.data?.amenities ?? [];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final feature = amenities[index];
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
              CachedNetworkImage(
                imageUrl: feature.amenityType?.icon ?? '',
                height: 20.h,
                width: 20.w,
                color: isDark ? AppColors.darkAppBar : null,
              ),
              SizedBox(width: 9.75.w),
              CustomTextSecondary(
                text: feature.amenityType?.name ?? '',
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
