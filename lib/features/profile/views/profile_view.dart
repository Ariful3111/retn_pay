import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/profile_info.dart';
import 'package:renter_pay/features/profile/widgets/profile_items_list.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      gradient: AppColors.userBackground.withOpacity(0.5),
      child: ListView(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                
              },
              child: Image.asset(IconsPath.profileDrawer,height: 24.h,width: 24.w,)),
            SizedBox(width: 8.w,),
            CustomText.primaryText(text: 'Tenant Profile',fontSize: 20.sp,fontWeight: FontWeight.w500,color: AppColors.primaryColorDark),
          ],
        ),
        SizedBox(height: 24.h,),
        ProfileInfo(),
        SizedBox(height: 12.h,),
        ProfileItemsList(),
      ],
    ));
  }
}