import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServicesSearch extends StatelessWidget {
  const ServicesSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesController servicesController = Get.find();
    return TypeAheadField(
      itemBuilder: (BuildContext context, int index) {
        return CustomTextSecondary(
          text: servicesController.serviceList[index],
          fontSize: 14.sp,
          color: AppColors.darkContainer,
        );
      },
      onSelected: (value) {
        print(value);
      },
      suggestionsCallback: (String search) {
        // return servicesController.serviceList.where((e) {
        //   return e.contains(search);
        // }).toList();
      },
      builder: (context, controller, focusNode) {
        return CustomTextField(controller: controller,fillColor: AppColors.whiteColor,prefixIcon: Padding(
          padding: EdgeInsets.only(left:16.w),
          child: Image.asset(IconsPath.homeSearch,height: 24.h,width: 24.w,),
        ),labelText: 'Search services',);
      },
    );
  }
}
