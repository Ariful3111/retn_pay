import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/features/profile/controllers/get_preference_controller.dart';
import 'package:renter_pay/features/profile/controllers/preference_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_checkbox.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_field.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_save_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ProfileEditProperty extends GetView<GetPreferenceController> {
  final ProfileEditController profileEditController;
  final PreferenceController preferenceController;
  const ProfileEditProperty({
    super.key,
    required this.profileEditController,
    required this.preferenceController,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final propertyAddressController =
        Get.isRegistered<PropertyAddressController>()
        ? Get.find<PropertyAddressController>()
        : null;

    return Container(
      padding: EdgeInsets.all(16.sp),
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
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextSecondary(
                  text: 'Property Preferences',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),
                ProfileEditField(
                  controller: preferenceController.rentController,
                  labelText: 'Weekly Rent',
                  readOnly: profileEditController.isEdit.value ? false : true,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: preferenceController.suburbTextController,
                  labelText: 'Preferred Suburbs',
                  hintText: preferenceController.suburbTextController.text,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: isDark
                      ? AppColors.darkPrimary
                      : AppColors.whiteColor,
                  readOnly: profileEditController.isEdit.value ? false : true,
                  focusNode: preferenceController.suburbFocusNode,
                  onChanged: (value) {
                    preferenceController.onSuburbQueryChanged(value);
                  },
                ),
                if (propertyAddressController != null)
                  Obx(() {
                    final suggestions = propertyAddressController.suggestions;
                    final isLoading = propertyAddressController.isLoading.value;
                    final shouldShow =
                        profileEditController.isEdit.value &&
                        preferenceController.showSuburbSuggestions.value &&
                        (isLoading || suggestions.isNotEmpty);

                    if (!shouldShow) return SizedBox(height: 16.h);

                    return Column(
                      children: [
                        SizedBox(height: 6.h),
                        Container(
                          width: MediaQuery.widthOf(context),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.darkPrimary
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(9.2.sp),
                            border: Border.all(
                              width: 0.89,
                              color: isDark
                                  ? AppColors.darkBorderPrimary
                                  : AppColors.whiteLightBorder,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 6.14),
                                blurRadius: 21.47,
                                color: AppColors.dropShadowColor.withValues(
                                  alpha: 0.10,
                                ),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: SizedBox(
                              height: 110.h,
                              child: isLoading
                                  ? ButtonLoading()
                                  : ListView.separated(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                        horizontal: 10.w,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: suggestions.length,
                                      separatorBuilder: (_, __) =>
                                          Divider(height: 12.h, thickness: 0.5),
                                      itemBuilder: (context, index) {
                                        final item = suggestions[index];
                                        final title = propertyAddressController
                                            .suggestionTitle(item);
                                        return InkWell(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            preferenceController
                                                .selectSuburbSuggestion(item);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6.h,
                                            ),
                                            child: CustomTextSecondary(
                                              text: title,
                                              fontSize: 12.27,
                                              fontWeight: FontWeight.w400,
                                              color: isDark
                                                  ? AppColors.darkPrimaryText
                                                  : AppColors.darkContainer,
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    );
                  })
                else
                  SizedBox(height: 16.h),
                ProfileEditField(
                  controller: preferenceController.amountController,
                  labelText: 'Amount',
                  readOnly: profileEditController.isEdit.value ? false : true,
                ),
                SizedBox(height: 16.h),
                ProfileEditField(
                  controller: preferenceController.bedroomController,
                  labelText: 'Bedroom',
                  readOnly: profileEditController.isEdit.value ? false : true,
                ),
                SizedBox(height: 16.h),
                ProfileEditField(
                  controller: preferenceController.bathroomController,
                  labelText: 'Bathroom',
                  readOnly: profileEditController.isEdit.value ? false : true,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ProfileEditCheckbox(),
          SizedBox(height: 20.h),
          // CustomDropdownMenu(
          //   alignmentGeometry: Alignment(0.2, 1),
          //   selectedTrailingIconColor: AppColors.secondaryTextColor,
          //   trailingIconColor: AppColors.secondaryTextColor,
          //   onSelect: (value) {
          //     preferenceController.initialPet.value = value!;
          //     preferenceController.isSelectedPet.value = true;
          //   },
          //   option: preferenceController.petType,
          //   isSelect: preferenceController.initialPet,
          //   label: CustomTextSecondary(
          //     text: 'Pet Type',
          //     fontSize: 12.sp,
          //     fontWeight: FontWeight.w400,
          //   ),
          //   textAlign: TextAlign.start,
          // ),
          SizedBox(height: 20),
          Obx(() {
            return preferenceController.isLoading.value
                ? Center(child: ButtonLoading())
                : ProfileSaveButton(
                    onPressed: () async {
                      if (Get.find<ProfileEditController>().isEdit.value) {
                        Get.find<ProfileEditController>().isEdit.value = false;
                        await preferenceController.updatePreference();
                      }
                    },
                  );
          }),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
