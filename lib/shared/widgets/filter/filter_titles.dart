import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';

class FilterTitles extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const FilterTitles({super.key, required this.title, required this.onTap, required this.icon});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextPrimary(
              text: title,
              fontSize: 15.34.sp,
              color:isDark?AppColors.darkAppBar: Color(0xFF252B37),
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(icon,color:isDark?AppColors.whiteColor: AppColors.darkPrimary,size: 18.sp,),
            )
          ],
        ),
        SizedBox(height: 8.32),
        Divider(
          height: 2.h,
          color:isDark?AppColors.darkBorderPrimary: Color(0xFFE5E9EE)),
      ],
    );
  }
}
