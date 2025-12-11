import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/add_repair_request_field.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_close_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddRepairRequest extends StatelessWidget {
  const AddRepairRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.all(25.r),
        height: 805.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.whiteColor,
          boxShadow: [
            myShadow(dy: 179.2, alpha: 0.10),
            myShadow(dy: 718.06, alpha: 0.09), 
            myShadow(dy: 1615.32, alpha: 0.05),
            myShadow(dy: 2872.24, alpha: 0.01),
            myShadow(dy: 4487.56, alpha: 0.0),
          ]
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPrimary(text: 'Repair Request',fontSize: 20.sp,),
                CustomCloseButton(onTap: () {  Navigator.pop(context); },)
              ],
            ),
            SizedBox(width: 4.h,),
            CustomTextPrimary(text: 'You can request a repair here',fontSize: 12.sp,fontWeight: FontWeight.w400,),
            SizedBox(height: 16.h,),
            AddRepairRequestField()
          ],
        ),
      ),
    );
  }

  BoxShadow myShadow(
    {
      required double dy,
      required double alpha,
    }
  ) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: 158.86,
      color: AppColors.darkPrimary.withValues(alpha:alpha)
    );
  }
}
