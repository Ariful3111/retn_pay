import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class HouseList extends StatelessWidget {
  final HomeController homeController;
  const HouseList({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return homeController.houseProperties.isEmpty
        ? SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Category(categoryName: 'House', categorySlug: 'house'),
              SizedBox(height: 16.h),
              SizedBox(
                height: 302.h,
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.houseProperties.length,
                  itemBuilder: (_, index) {
                    Property property = homeController.houseProperties[index];
                    return ItemContainer(
                      property: property,
                      imageHeight: 220.h,
                      imageWidth: 390.w,
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
