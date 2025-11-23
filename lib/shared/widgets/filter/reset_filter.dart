import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class ResetFilter extends StatelessWidget {
  final VoidCallback onTap;
  const ResetFilter({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
            height: 54.h,
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              border: Border.all(width: 0.77,color:isDark?AppColors.darkBorderPrimary: AppColors.secondaryBorder),
              borderRadius: BorderRadius.circular(9.sp)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 18.w,),
                CustomTextPrimary(text: 'Property Preference',fontSize: 12.sp,fontWeight: FontWeight.w500),
                SizedBox(width: 24.w,),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 40.h,
                    width: 95.w,
                    decoration: BoxDecoration(
                      color: isDark? AppColors.darkContainer:null,
                      borderRadius: BorderRadius.circular(6.14.sp),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomTextSecondary(text: 'Reset Filter',fontSize: 11.sp,color:isDark? AppColors.darkSecondaryText:Color(0xFF434953)),
                        Image.asset(IconsPath.reset,height: 18.h,width: 18.w,color: isDark?AppColors.darkSecondaryText:null,),
                      ],
                    ),
                  ),     
                ),
              ],
            ),
          );
  }
}