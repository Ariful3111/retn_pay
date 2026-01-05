import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomShadowOverlayButton {
   shadow({required BuildContext context,ImageFilter ? imageFilter}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
     return Positioned.fill(
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: BackdropFilter(
            filter:imageFilter?? ImageFilter.blur(),
            child: Container(
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                    isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor.withValues(alpha: 0.85),
                    isDark
                        ? AppColors.darkSecondary.withValues(alpha: 0.5)
                        : AppColors.whiteColor.withValues(alpha: 0.5),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
  
}
