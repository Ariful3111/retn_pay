import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ProfileEditCheckbox extends StatelessWidget {
  const ProfileEditCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileEditController profileEditController = Get.find();
    return Obx(() {
      return Row(
        children: [
          checkBox(
            value: profileEditController.isPets.value,
            onChanged: (value) {
              profileEditController.isPets.value = value!;
            },
            gradient: AppColors.checkBox,
            borderRadius: 5.r, title: 'Pets',
          ),
          SizedBox(width: 51.w,),
          checkBox(
            value: profileEditController.isParking.value,
            onChanged: (value) {
              profileEditController.isParking.value = value!;
            },
            gradient: AppColors.checkBox,
            borderRadius: 5.r, title: 'Parking',
          ),
        ],
      );
    });
  }

  Widget checkBox({
    required bool value,
    required Function(bool?) onChanged,
    required Gradient gradient,
    required double borderRadius,
    required String title,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linearToEaseOut,
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              gradient: value ? gradient : null,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: value ? Colors.transparent : AppColors.primaryBorder,
                width: 1.r,
              ),
            ),
            child: value
                ? Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        ),
        SizedBox(width: 10.w),
        CustomTextPrimary(text: title, fontSize: 20.sp),
      ],
    );
  }
}
