import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class ResetFilter extends StatelessWidget {
  final VoidCallback onTap;
  const ResetFilter({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 54.h,
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(width: 0.77,color: AppColors.secondaryBorder),
              borderRadius: BorderRadius.circular(9.sp)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 18.w,),
                CustomText.primaryText(text: 'Property Preference',fontSize: 12.sp,fontWeight: FontWeight.w500),
                SizedBox(width: 24.w,),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 40.h,
                    width: 95.w,
                    color: Color(0xFFF4F6F8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText.secondaryText(text: 'Reset Filter',fontSize: 11.sp,color: Color(0xFF434953)),
                        Image.asset(IconsPath.reset,height: 18.h,width: 18.w,),
                      ],
                    ),
                  ),     
                ),
              ],
            ),
          );
  }
}