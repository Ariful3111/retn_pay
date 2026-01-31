import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class InspectionPropertyImage extends GetWidget<PropertyViewController> {
  const InspectionPropertyImage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(20.r),
      height: 353.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.07.r),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            controller.propertyDetails.value?.data?.images?.first.imagePath ??
                '',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7.07.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4.71),
                blurRadius: 16.5,
                color: AppColors.dropShadowColor.withValues(alpha: 0.10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPrimary(
                text: controller.propertyDetails.value?.data?.name ?? '',
                fontSize: 20.sp,
              ),
              Row(
                children: [
                  Image.asset(IconsPath.bed, height: 16.5.h, width: 16.5.w),
                  SizedBox(width: 9.3.w),
                  CustomTextSecondary(
                    text: 'Bed',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightText,
                  ),
                  SizedBox(width: 7.07.w),
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
                    color: AppColors.lightText,
                  ),
                  SizedBox(width: 7.07.w),
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
                    text:
                        "${controller.propertyDetails.value?.data?.units?.first.size ?? ''} sqft",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightText,
                  ),
                ],
              ),
              CustomTextSecondary(
                text:
                    '${controller.propertyDetails.value?.data?.city ?? ''}, ${controller.propertyDetails.value?.data?.country ?? ''}',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightText,
              ),
              CustomTextSpan(
                title:
                    '\$${controller.propertyDetails.value?.data?.units?.first.rentAmount ?? ''}',
                spantext: '/week',
                fontSize: 16.sp,
                spanFontSize: 12.sp,
                fontWeight: FontWeight.w400,
                spanColor: Color(0xFF505F79),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
