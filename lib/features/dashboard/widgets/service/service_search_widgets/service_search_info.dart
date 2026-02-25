import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/service_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_switcher.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_info_item.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceSearchInfo extends StatelessWidget {
  final bool isShow;
  final VoidCallback onTap;
  final bool bookButton;
  final ServiceDetailsController controller;
  const ServiceSearchInfo({
    super.key,
    required this.isShow,
    required this.onTap,
    required this.bookButton,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ServiceDetailsContainer(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.widthOf(context),
            height: 211.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(ImagesPath.service),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Image.asset(IconsPath.service, height: 33.83.h, width: 33.83.w),
              SizedBox(width: 9.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPrimary(
                      text:
                          controller
                              .serviceDetails
                              .value
                              ?.data
                              ?.data
                              ?.first
                              .title ??
                          '',
                      fontSize: 20.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkContainer,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextSecondary(
                      text:
                          controller
                              .serviceDetails
                              .value
                              ?.data
                              ?.data
                              ?.first
                              .subtext ??
                          '',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              ServiceDetailsSwitcher(isShow: isShow, onTap: onTap),
            ],
          ),
          SizedBox(height: 12.h),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: isShow
                ? CustomTextSecondary(
                    text:
                        controller
                            .serviceDetails
                            .value
                            ?.data
                            ?.data
                            ?.first
                            .description ??
                        '',
                    fontSize: 14.sp,
                  )
                : SizedBox.shrink(),
          ),
          SizedBox(height: 14.h),
          ServiceSearchInfoItem(),
          SizedBox(height: 16.h),
          if (bookButton)
            CustomPrimaryButton(
              text: 'Book Now',
              borderRadius: BorderRadius.circular(6.r),
              height: 40.h,
              width: 140.w,
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}
