import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ProfileSaveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ProfileSaveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomPrimaryButton(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      height: 40.h,
      width: 102.w,
      borderRadius: BorderRadius.circular(8.r),
      onPressed: onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(IconsPath.profile, height: 20.h, width: 20.w),
          CustomTextSecondary(text: 'Save', color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
