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
          margin: EdgeInsets.only(bottom: 12.h),
          height: 52.h,
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.8.r),
            color: isDark ? AppColors.primaryTextColor : AppColors.darkAppBar,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                offset: Offset(0, 2.sp),
                blurRadius: 6.sp,
                spreadRadius: 0.5.sp,
              ),
            ],
          ),
          child: Row(
            children: [
              // Badge with icon
              Container(
                height: 30.h,
                width: 30.w,
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColorDark,
                      AppColors.primaryColorDark.withValues(alpha: 0.7),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColorDark.withValues(alpha: 0.3),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      feature.amenityType?.icon ?? '',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              CustomTextSecondary(
                text: feature.amenityType?.name ?? '',
                color: isDark
                    ? AppColors.darkAppBar
                    : AppColors.primaryTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        );
      },
    );
  }
}
