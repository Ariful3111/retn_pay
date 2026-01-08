import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_key_release_controller.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attached_image.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordKeyReleaseRoomInfo extends StatelessWidget {
  const LandlordKeyReleaseRoomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.only(top: 24.h, left: 24.h, bottom: 24.h),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: isDark ? AppColors.darkAuthBG : AppColors.userBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoText(text: 'Room'),
          SizedBox(height: 12.h),
          infoText(text: 'Key Images:'),
          SizedBox(height: 8.h),
          CustomAttachedImage(
            imageList: Get.find<LandlordKeyReleaseController>().imageList,
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(right: 24.h),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Room/Door name*',
                  controller: TextEditingController(),
                  fillColor: isDark
                      ? AppColors.darkPrimary
                      : AppColors.whiteColor,
                ),
                SizedBox(height: 14.h),
                CustomDateField(
                  controller: TextEditingController(),
                  onTap: () {
                    DatePicker.pickDate(
                      context: context,
                      onDateSelected: (date) {
                        debugPrint(date.toString());
                      },
                    );
                  },
                  label: "Date*",
                  fillColor: isDark
                      ? AppColors.darkPrimary
                      : AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoText({required String text}) {
    return CustomTextPrimary(
      text: text,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
