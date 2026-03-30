import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomBulletPointText extends StatelessWidget {
  final List<String> items;
  const CustomBulletPointText({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
            items.length,
            (index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  CustomTextSecondary(
                    text: '•',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(width: 4.w),
                Expanded(
                  child: CustomTextSecondary(
                    text: items[index],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.darkTextColor,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}