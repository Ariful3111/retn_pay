import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class FilterTitles extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const FilterTitles({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.41.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.primaryText(
                text: title,
                fontSize: 15.34.sp,
                color: Color(0xFF252B37),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 10.74.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.darkPrimary,
                      width: 1.53.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.41.w),
          child: Divider(color: Color(0xFFE5E9EE)),
        ),
      ],
    );
  }
}
