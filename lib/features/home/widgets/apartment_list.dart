import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class ApartmentList extends StatelessWidget {
  final HomeController homeController;
  const ApartmentList({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return homeController.apartmentProperties.isEmpty
        ? SizedBox()
        : Column(
            children: [
              Category(categoryName: 'Apartment', onTap: () {}),
              SizedBox(height: 16.h),
              SizedBox(
                height: 302.h,
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.apartmentProperties.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    Property property =
                        homeController.apartmentProperties[index];
                    return ItemContainer(
                      property: property,
                      imageHeight: 220.h,
                      imageWidth: 300.w,
                      padding: EdgeInsetsGeometry.only(right: 12.w),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
            ],
          );
  }
}
