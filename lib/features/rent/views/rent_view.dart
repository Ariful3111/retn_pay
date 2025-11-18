import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
import 'package:renter_pay/features/rent/widgets/page_no.dart';
import 'package:renter_pay/features/rent/widgets/property_sort.dart';
import 'package:renter_pay/features/rent/widgets/rent_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class RentView extends StatelessWidget {
  const RentView({super.key});
  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    RentController rentController = Get.find();
    return CustomContainer(
      gradient: AppColors.userBackground.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        controller: mainHomeController.scrollController,
        child: Column(
          children: [
            RentAppbar(),
            SizedBox(height: 7.h),
            PropertySort(),
            SizedBox(height: 19.28.h),
            Obx(() {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: rentController.currentItems.length,
                itemBuilder: (_, index) {
                   int globalIndex = rentController.startIndex + index;
                  return ItemContainer(
                    imageHeight: 250.h,
                    imageWidth: MediaQuery.widthOf(context),
                    image: ImagesPath.house,
                    padding: EdgeInsetsGeometry.only(bottom: 24.h),
                    onVR: () {},
                    updateRating: (value) {
                      rentController.houseRating[globalIndex] = value;
                    },
                    initialRating: rentController.houseRating[globalIndex],
                  );
                },
              );
            }),
            
          ],
        ),
      ),
    );
  }
}
