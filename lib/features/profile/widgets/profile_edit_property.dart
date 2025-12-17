import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_checkbox.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_field.dart';
import 'package:renter_pay/features/profile/widgets/profile_save_button.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ProfileEditProperty extends StatelessWidget {
  const ProfileEditProperty({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProfileEditController profileEditController = Get.find();
    return Container(
      padding: EdgeInsets.all(16.sp),
      height: 705.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: 'Property Preferences',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20.h),
          ProfileEditField(
            controller: profileEditController.rentController,
            labelText: 'Weekly Rent',
            hintText: '\$344',
          ),
          SizedBox(height: 16.h),
          ProfileEditField(
            controller: profileEditController.subsController,
            labelText: 'Preferred Suburbs',
            hintText: 'Dhaka',
          ),
          SizedBox(height: 16.h),
          ProfileEditField(
            controller: profileEditController.amountController,
            labelText: 'Amount',
            hintText: '\$300',
          ),
          SizedBox(height: 16.h),
          ProfileEditField(
            controller: profileEditController.bedroomController,
            labelText: 'Bedroom',
            hintText: '3',
          ),
          SizedBox(height: 16.h),
          ProfileEditField(
            controller: profileEditController.bathroomController,
            labelText: 'Bathroom',
            hintText: '2',
          ),
          SizedBox(height: 20.h),
          ProfileEditCheckbox(),
          SizedBox(height: 20.h,),
          CustomDropdownMenu(
            selectedTrailingIconColor: AppColors.secondaryTextColor,
            trailingIconColor: AppColors.secondaryTextColor,
            onSelect: (value) {
              profileEditController.initialPet.value = value!;
              profileEditController.isSelectedPet.value = true;
            },
            option: profileEditController.petType,
            isSelect: profileEditController.initialPet, label:CustomTextSecondary(
          text:'Pet Type',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ), textAlign: TextAlign.start ,
          ),
          SizedBox(height: 20,),
          ProfileSaveButton(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
