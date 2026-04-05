import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class PropertyDetailsInfo extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const PropertyDetailsInfo({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final data = propertyDetails.data;
    if (data == null) {
      return SizedBox();
    }
    final buildingSize = data.buildingSize ?? '';
    final landSize = data.landSize ?? '';
    final size = buildingSize == '0.00' || buildingSize.isEmpty
        ? '${landSize}sft'
        : '${buildingSize}sft';
    final rentAmount = (data.units?.isNotEmpty ?? false)
        ? (data.units!.first.rentAmount ?? '0')
        : '0';
    return SizedBox(
      width: MediaQuery.widthOf(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextPrimary(
            text: '${data.city ?? ''}, ${data.country ?? ''}',
            fontSize: 24.sp,
          ),
          Row(
            children: [
              Image.asset(IconsPath.bed, height: 16.5.h, width: 16.5.w),
              SizedBox(width: 9.3.w),
              CustomTextSecondary(
                text: 'Bed-${data.bedrooms ?? 0}',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              SizedBox(width: 5.42.w),
              Center(
                child: Image.asset(
                  IconsPath.bathroom,
                  height: 16.5.h,
                  width: 16.5.w,
                ),
              ),
              SizedBox(width: 2.w),
              CustomTextSecondary(
                text: 'Bath-${data.bathrooms ?? 0}',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              SizedBox(width: 6.w),
              DottedBorder(
                options: RectDottedBorderOptions(
                  color: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
                  borderPadding: EdgeInsets.all(0.39.sp),
                  dashPattern: [1.5, 1.5],
                ),
                child: SizedBox(
                  height: 8.h,
                  width: 8.w,
                  child: Center(
                    child: Image.asset(
                      IconsPath.sizeArrow,
                      height: 4.h,
                      width: 4.w,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              CustomTextSecondary(
                text: size,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              SizedBox(width: 4.w),
              Image.asset(IconsPath.availability, height: 12.h, width: 12.w),
              SizedBox(width: 2.w),
              CustomTextSecondary(
                text: data.status ?? "",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CustomTextSpan(
                title: '\$$rentAmount',
                spantext: '/week',
                spanColor: isDark
                    ? AppColors.lightText
                    : AppColors.darkPrimary.withValues(alpha: 0.5),
                fontSize: 22.sp,
              ),
              SizedBox(width: 5.w),
              Image.asset(
                IconsPath.appCurrency,
                height: 15.h,
                width: 15.h,
                color: isDark ? null : AppColors.darkPrimary,
              ),
              SizedBox(width: 3.w),
              CustomTextSpan(
                title: '\$$rentAmount',
                spantext: '/week',
                spanColor: isDark
                    ? AppColors.lightText
                    : AppColors.darkPrimary.withValues(alpha: 0.5),
                fontSize: 22.sp,
              ),
              SizedBox(width: 10.w),
              CustomTextSpan(
                title: 'Available From: ',
                spantext: data.status?.capitalizeFirst ?? "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
