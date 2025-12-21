import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceSearchPastWork extends StatelessWidget {
  const ServiceSearchPastWork({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    return ServiceDetailsContainer(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(serviceSearchController.pastWork.length, (
          index,
        ) {
          final list = serviceSearchController.pastWork[index];
          return card(image: list['Image'], text: list['Text']);
        }),
      ),
    );
  }

  Widget card({required String image, required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Stack(
        children: [
          Container(
            
            height: 367.h,
            width: 344.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r)),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [
                    AppColors.darkPrimary.withValues(alpha: 0.0),
                    AppColors.darkPrimary,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 14.h,
            left: 14.w,
            right: 14.w,
            child: CustomTextSecondary(
            text: text,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),),
        ],
      ),
    );
  }
}
