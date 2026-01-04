import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_button.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_images.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_upload_image.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddNewPropertyVirtualTour extends StatelessWidget {
  const AddNewPropertyVirtualTour({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AddNewPropertyContainer(
      child: Column(
        children: [
          CustomTextPrimary(
            text: 'Create Virtual Tour:',
            fontSize: 20.sp,
            color: isDark ? null : AppColors.darkContainer,
          ),
          SizedBox(height: 20.h),
          AddNewPropertyUploadImage(onTap: () {}, isTitle: true),
          SizedBox(height: 16.h),
          AddNewPropertyInfoButton(onAdd: () {}, onUpload: () {}),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoImages(),
          SizedBox(height: 20.h,),
          CustomPrimaryButton(
            height: 52.h,
            width: 100.w,
            borderRadius: BorderRadius.circular(8.r),
            text: 'Go',
            onPressed: () {
            
          },)
        ],
      ),
    );
  }
}
