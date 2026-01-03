import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';

class ItemInfo extends StatelessWidget {
  final VoidCallback onVR;
  final ValueChanged<double> updateRating;
  final VoidCallback? onTapDetails;
  final double initialRating;
  final double imageWidth;
  const ItemInfo({
    super.key,
    required this.onVR,
    required this.updateRating,
    this.onTapDetails,
    required this.initialRating, required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTapDetails,
          child: Row(
            children: [
              Image.asset(IconsPath.bed, height: 12.h, width: 12.w),
              SizedBox(width: 1.56.w),
              CustomTextSecondary(
                text: 'Bed-04',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              SizedBox(width: 5.42.w),
              Center(
                child: Image.asset(
                  IconsPath.bathroom,
                  height: 15.21.h,
                  width: 15.21.w,
                ),
              ),
              SizedBox(width: 2.w),
              CustomTextSecondary(
                text: 'Bath-04',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              SizedBox(width: 5.42.w),
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
              SizedBox(width: 4.w),
              CustomTextSecondary(
                text: '2500sft',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              SizedBox(width: 4.w),
              Image.asset(IconsPath.availability, height: 12.h, width: 12.w),
              SizedBox(width: 2.w),
              CustomTextSecondary(
                text: 'Jan-26',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: imageWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: onTapDetails,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          IconsPath.location,
                          height: 14.h,
                          width: 14.w,
                          color: isDark ? null : AppColors.darkPrimary,
                        ),
                        SizedBox(width: 4.w),
                        CustomTextPrimary(text: 'New York, USA', fontSize: 16.sp),
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextSpan(
                          title: '\$280',
                          spantext: '/week',
                          spanColor: Color(0xFF505F79),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              IconsPath.appCurrency,
                              height: 11.h,
                              width: 11.h,
                              color: isDark ? null : AppColors.darkPrimary,
                            ),
                            SizedBox(width: 3.w),
                            CustomTextSpan(
                              title: '280',
                              spantext: '/week',
                              spanColor: Color(0xFF505F79),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onVR,
                    child: Image.asset(IconsPath.vR, height: 16.h, width: 16.w),
                  ),
                  CustomRatingBuilder(
                    onRating: updateRating,
                    initialRating: initialRating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
