import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/view_notice_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ViewNotice extends StatelessWidget {
  const ViewNotice({super.key});

  @override
  Widget build(BuildContext context) {
    List viewInfo = [
      'Current Rent: \$2,000/month',
      'Contract Expiry: 10 Sep 2026',
    ];
    return Container(
      width: 390.w,
      height: 262.58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Container(
            height: 8.72.h,
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              gradient: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextSecondary(
                  text: 'Agreement Renewal Request',
                  fontSize: 20.sp,
                ),
                SizedBox(height: 17.43.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImagesPath.house,
                      height: 43.58.h,
                      width: 43.58.w,
                    ),
                    SizedBox(width: 13.07.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextPrimary(
                          text: 'Apt 102 Green Street',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomTextSecondary(
                          text: '*Eligible for rent adjustment.',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColorDark,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 17.43.h),
                ...List.generate(viewInfo.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.71.h),
                    child: CustomTextSecondary(text: viewInfo[index]),
                  );
                }),
                SizedBox(height: 17.43.h),
                ViewNoticeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
