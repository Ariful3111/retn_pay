import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_photo.dart';
import 'package:renter_pay/features/dashboard/widgets/request_form.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RepairRequest extends StatelessWidget {
  const RepairRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 24.h),
      height: 412.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: CustomTextPrimary(text: 'Submit a Repair Request',fontSize: 24.sp,color: AppColors.primaryColorDark,)),
          SizedBox(height: 18.h,),
          RequestForm(),
          SizedBox(height: 8.79.h,),
          CustomTextSecondary(text: 'Attach Photos',color: AppColors.darkContainer,),
          SizedBox(height: 8.79.h,),
          RepairPhoto(),
          SizedBox(height: 13.18.h,),
          CustomPrimaryButton(height: 54.h, onPressed: () {
            
          },
          text: 'Submit Repair Request',
          )
        ],
      ),
    );
  }
}