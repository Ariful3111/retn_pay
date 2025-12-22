import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_from_field.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attached_image.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

import '../../controllers/service_search_controller.dart';

class ServiceRequestFromDetails extends StatelessWidget with ServiceFromField{
  const ServiceRequestFromDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
            text: 'Service Request Details:',
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          myField(
            controller: serviceSearchController.problemController,
            context: context,
            labelText:CustomTextSecondary(text: 'Location of Problem*') ,
          ),
          SizedBox(height: 20.h),
          CustomTextPrimary(text: 'Attached Photos',fontSize: 16.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 4.h),
          CustomAttachedImage(imageList: serviceSearchController.uploadedImage,),
          SizedBox(height: 20.h),
          myField(controller: serviceSearchController.descriptionController, context: context, labelText: CustomTextSecondary(text: 'Please provide a brief description of the problem*'),isAlignLabelWithHint: true,maxLines: 3),
          SizedBox(height: 20.h),

      ],
    );
  }
}