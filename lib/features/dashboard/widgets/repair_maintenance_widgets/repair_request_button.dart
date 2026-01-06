import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/add_repair_request.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RepairRequestButton extends StatelessWidget {
  const RepairRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddRepairRequest();
              },
            );
          },
          child: Container(
            height: 41.h,
            width: 148.w,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              gradient: isDark ? AppColors.darkAppIcon : LinearGradient(colors: [AppColors.whiteColor,AppColors.whiteColor]),
              border: Border.all(
                width: 0.8.r,
                color: isDark
                    ? AppColors.darkBorderPrimary
                    : AppColors.primaryBorder,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0.8),
                  blurRadius: 1.16,
                  color: AppColors.buttonShadowColor.withValues(alpha: 0.06),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextSecondary(
                  text: 'Issue A Request',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark?AppColors.darkPrimary:null,
                ),
                Image.asset(IconsPath.add, height: 20.h, width: 20.w,color: isDark?AppColors.darkPrimary:null,),
              ],
            ),
          ),
        );
  }
}