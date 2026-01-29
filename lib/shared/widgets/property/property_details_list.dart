import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyDetailsList extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const PropertyDetailsList({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final detailsList = propertyDetails.data?.features ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text: propertyDetails.data?.description ?? '',
          color: isDark
              ? AppColors.darkSecondaryText.withValues(alpha: 0.5)
              : AppColors.darkPrimary.withValues(alpha: 0.5),
        ),
        SizedBox(height: 12.h),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: detailsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Image.asset(
                      IconsPath.propertyCheck,
                      height: 15.h,
                      width: 15.w,
                      color: isDark ? AppColors.whiteColor : null,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CustomTextPrimary(
                      text: detailsList[index],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
