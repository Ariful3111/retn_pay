import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class GraphTopInfo extends StatelessWidget {
  const GraphTopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'May 26, 2025',
                    style: GoogleFonts.manrope(
                      fontSize: 9.34.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF636875),
                    ),
                  ),
                  SizedBox(height: 11.h),
                  CustomTextPrimary(text: '\$6,600', fontSize: 24.sp),
                ],
              ),
              Spacer(),
              ...List.generate(3, (index) {
                return Padding(
                  padding:  EdgeInsets.only(right: 16.w),
                  child: Row(
                    children: [
                      CustomTextPrimary(text: 'Property1', fontSize: 10.sp),
                      SizedBox(width: 4.w),
                      Container(
                        height: 16.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          color: AppColors.primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
  }
}