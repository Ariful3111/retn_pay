import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomBulletPointText extends StatelessWidget {
  final List<String> items;
  final List<String>? title;
  final Color? color;
  const CustomBulletPointText({super.key, required this.items, this.color, this.title});

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
                    text:title?[index]?? '•',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(width: 4.w),
                Expanded(
                  child: CustomTextPrimary(
                    text: items[index],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}