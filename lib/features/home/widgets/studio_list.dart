import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class StudioList extends StatelessWidget {
  final HomeController homeController;
  const StudioList({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return homeController.studioProperties.isEmpty
        ? SizedBox()
        : Column(
            children: [
              Category(categoryName: 'Studio Apartment', onTap: () {}),
              SizedBox(height: 16.h),
              SizedBox(
                height: 302.h,
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.studioProperties.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    Property property = homeController.studioProperties[index];
                    return ItemContainer(
                      property: property,
                      imageHeight: 220.h,
                      imageWidth: 300.w,
                      padding: EdgeInsetsGeometry.only(right: 12.w),
                      favoriteController: Get.find<FavoriteController>(),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
  }
}
