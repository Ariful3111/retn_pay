import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service_address_field.dart';
import 'package:renter_pay/features/dashboard/widgets/service_from_field.dart';
import 'package:renter_pay/features/dashboard/widgets/service_request_from_details.dart';
import 'package:renter_pay/features/dashboard/widgets/service_time.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceRequestForm extends StatelessWidget with ServiceFromField{
  const ServiceRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Property Service Request Form',
            fontSize: 22.sp,
          ),
          SizedBox(height: 24.h),
          myField(
            controller: serviceSearchController.firstNameController,
            context: context,
            labelText:myLabel(title: 'Resident First Name', spanText: '*') ,
          ),
          SizedBox(height: 20.h),
          myField(
            controller: serviceSearchController.lastNameController,
            context: context,
            labelText:myLabel(title: 'Resident Last Name', spanText: '*') ,
          ),
          SizedBox(height: 20.h),
          myField(
            controller: serviceSearchController.emailController,
            context: context,
            labelText:myLabel(title: 'Resident Email', spanText: "*") ,
          ),
          SizedBox(height: 20.h),
          myField(
            controller: serviceSearchController.numberController,
            context: context,
            labelText:myLabel(title: 'Resident Phone Number', spanText: "*") ,
          ),
          SizedBox(height: 24.h),
          ServiceAddressField(),
          SizedBox(height: 24.h),
          ServiceRequestFromDetails(),
          SizedBox(height: 24.h,),
          ServiceTime(),
        ],
      ),
    );
  }
}
