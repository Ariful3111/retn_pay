import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/rent/widgets/rent_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class RentView extends StatelessWidget {
  const RentView({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    return CustomContainer(
      gradient: AppColors.userBackground.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        controller: mainHomeController.scrollController,
        children: [
          RentAppbar(),
        ],
      ),
    );
  }
}