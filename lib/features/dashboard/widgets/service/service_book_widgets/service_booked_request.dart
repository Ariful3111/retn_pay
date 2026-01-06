import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_book_info.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_image.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceBookedRequest extends StatelessWidget with ServiceBookInfo{
  const ServiceBookedRequest({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ServiceDetailsContainer(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomTextPrimary(
              text: 'Service Request Details',
              fontSize: 22.w,
            ),
          ),
          SizedBox(height: 24.h),
          myInfo(
            title: 'Resident First Name:',
            data: serviceSearchController.firstNameController.text,
          ),
          myInfo(
            title: 'Resident Last Name:',
            data: serviceSearchController.lastNameController.text,
          ),
          myInfo(
            title: 'Resident Email:',
            data: serviceSearchController.emailController.text,
          ),
          myInfo(
            title: 'Resident Phone Number:',
            data: serviceSearchController.numberController.text,
          ),
          SizedBox(height: 24.h),
          CustomTextSecondary(text: 'Property Address:',color: isDark?AppColors.whiteColor:AppColors.darkTextColor,),
          SizedBox(height: 12.h),
          myInfo(title: 'Address Line 1:', data: serviceSearchController.address1Controller.text),
          myInfo(title: 'Address Line 2:', data: serviceSearchController.address2Controller.text),
          myInfo(title: 'City', data: serviceSearchController.cityController.text),
          myInfo(title: 'State', data: serviceSearchController.state.value),
          myInfo(title: 'Zip Code', data: serviceSearchController.zipController.text),
          SizedBox(height: 24.h,),
          ServiceBookedImage(),
        ],
      ),
    );
  }

  
}
