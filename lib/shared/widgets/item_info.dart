import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';

class ItemInfo extends StatelessWidget {
  final double initialRating;
  final double imageWidth;
  final Property property;
  const ItemInfo({
    super.key,
    required this.initialRating,
    required this.imageWidth,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    String size = property.buildingSize == '0.00'
        ? '${property.landSize}sft'
        : '${property.buildingSize}sft';
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            HitTestBehavior.opaque;
            Get.toNamed(AppRoutes.rentDetails, arguments: property.id);
          },
          child: Row(
            children: [
              Image.asset(IconsPath.bed, height: 12.h, width: 12.w),
              SizedBox(width: 1.56.w),
              CustomTextSecondary(
                text: 'Bed-${property.bedrooms ?? 0}',
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
                text: 'Bath-${property.bathrooms ?? 0}',
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
                text: size,
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
              Expanded(
                child: InkWell(
                  onTap: () {
                    HitTestBehavior.opaque;
                    Get.toNamed(AppRoutes.rentDetails, arguments: property.id);
                  },
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
                          Expanded(
                            child: CustomTextPrimary(
                              text: '${property.city}, ${property.country}',
                              fontSize: 16.sp,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CustomTextSpan(
                              title:
                                  '\$${property.units!.first.rentAmount ?? 0}',
                              spantext: '/week',
                              spanColor: Color(0xFF505F79),
                            ),
                            SizedBox(width: 5.w),
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
                                  title:
                                      '${property.units!.first.rentAmount ?? 0}',
                                  spantext: '/week',
                                  spanColor: Color(0xFF505F79),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(IconsPath.vR, height: 16.h, width: 16.w),
                  ),
                  CustomRatingBuilder(
                    onRating: (value) {},
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
