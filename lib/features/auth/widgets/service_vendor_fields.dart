import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class ServiceVendorFields extends StatelessWidget {
  const ServiceVendorFields({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();
    return Column(
      children: [
        SizedBox(height: 14.h),
        CustomTextField(
            hintText: "Enter You're Company/Business Name",
            labelText: "Company/Business Name",
            controller: signupController.companyNameController,
          ),
          SizedBox(height: 14.h),
        CustomTextField(
            hintText: "Enter You're Business Type",
            labelText: "Business Type",
            controller: signupController.businessTypeController,
          ),
          SizedBox(height: 14.h),
        CustomTextField(
            hintText: "Enter You're ABN",
            labelText: "ABN",
            controller: signupController.abnController,
          ),
          SizedBox(height: 14.h),
        CustomTextField(
            hintText: "Enter You're Business Description",
            labelText: "Description",
            controller: signupController.descriptionController,
          ),
      ],
    );
  }
}