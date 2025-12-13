import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ContactField extends StatelessWidget {
  const ContactField({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 543.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.67.r),
        gradient:isDark? AppColors.darkAuthBG:AppColors.userBackground,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            CustomTextPrimary(
              text: 'Send Us a Message',
              fontSize: 24.sp,
              color:isDark?AppColors.whiteColor : AppColors.primaryColorDark,
            ),
            SizedBox(height: 8.h),
            CustomTextSecondary(
              text:
                  'Fill out the form below and our team will\nget back to you within 24 hours.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            userField(
              controller: profileController.nameController,
              label: 'Full Name',
              hint: 'Enter Your Full Name', context: context,
            ),
            SizedBox(height: 15.h),
            userField(
              controller: profileController.emailController,
              label: 'Email Address',
              hint: 'Enter Your Email Address', context: context,
            ),
            SizedBox(height: 15.h),
            userField(
              controller: profileController.nameController,
              label: 'Phone Number',
              hint: 'Enter Your Phone Number', context: context,
            ),
            SizedBox(height: 15.h),
            userField(
              controller: profileController.nameController,
              label: 'Message',
              hint: 'Demo Message',
              maxLines: 3, context: context,
              isAlignLabelWithHint: true,
              hintDirection: TextDirection.ltr
            ),
            SizedBox(height: 24.h),
            CustomPrimaryButton(
              height: 48.h,
              width: 144.w,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.22.r),
                gradient: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.11,
                    color: AppColors.darkPrimary.withValues(alpha: 0.10),
                  ),
                ],
              ),
              text: 'Send Message',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget userField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    Widget? suffix,
    AutovalidateMode? validateMode,
    int? maxLines,
    required BuildContext context,
    bool ? isAlignLabelWithHint,
    TextDirection ?hintDirection,
  }) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      validation: validateMode,
      validator: validator,
      maxLines: maxLines,
      isAlignLabelWithHint: isAlignLabelWithHint,
      hintDirection: hintDirection,
      fillColor:isDark?AppColors.darkPrimary : AppColors.whiteColor,
      labelTextWidget: CustomTextSecondary(
        text: label,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      hintTextWidget: CustomTextSecondary(text: hint),
      suffixIcon: suffix,
    );
  }
}
