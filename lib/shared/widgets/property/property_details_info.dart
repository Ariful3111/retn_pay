import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_span.dart';

class PropertyDetailsInfo extends StatelessWidget {
  const PropertyDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness ==Brightness.dark;
    return SizedBox(
      height: 88.4.h,
      width: MediaQuery.widthOf(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextPrimary(
            text: 'Maple Grove Garden House',
            fontSize: 24.sp,
          ),
          Row(
            children: [
              Image.asset(IconsPath.bed, height: 16.5.h, width: 16.5.w),
              SizedBox(width: 9.3.w),
              CustomTextSecondary(
                text: 'Bed',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7E8B9C),
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
                text: 'Bathroom',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7E8B9C),
              ),
              SizedBox(width: 6.w),
              DottedBorder(
                options: RectDottedBorderOptions(
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkPrimary,
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
                text: '2500sft',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7E8B9C),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              CustomTextSpan(
                title: '\$280',
                spantext: '/week',
                spanColor: AppColors.darkPrimary.withValues(alpha: 0.5),
                fontSize: 22.sp,
              ),
              SizedBox(width: 60.w),
              CustomTextSecondary(
                text: 'New York, USA',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7E8B9C),
              ),
            ],
          ),
        ],
      ),
    );
  }
}