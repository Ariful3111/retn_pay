import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class LandlordSignature extends StatelessWidget {
  const LandlordSignature({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 212.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(width: 0.85.r, color: AppColors.secondaryBorder),
      ),
      child: Center(
        child: Image.asset(
          ImagesPath.landlordSignature,
          height: 109.h,
          width: 222.w,
          color: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
        ),
      ),
    );
  }
}
