import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AddNewPropertyInfoButton extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onUpload;
  const AddNewPropertyInfoButton({
    super.key,
    required this.onAdd,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        addMoreButton(onAdd: onAdd),
        SizedBox(width: 12.w),
        CustomPrimaryButton(
          onPressed: onUpload,
          height: 52.h,
          width: 164.w,
          borderRadius: BorderRadius.circular(8.r),
          text: 'Upload',
        ),
      ],
    );
  }
}

Widget addMoreButton({required VoidCallback onAdd}) {
  return CustomSecondaryButton(
    height: 52.h,
    width: 164.w,
    borderRadius: BorderRadius.circular(6.r),
    onPressed: onAdd,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add, size: 24.sp, color: AppColors.primaryColorDark),
        SizedBox(width: 4.w),
        CustomTextSecondary(
          text: 'Add More',
          color: AppColors.primaryColorDark,
        ),
      ],
    ),
  );
}
