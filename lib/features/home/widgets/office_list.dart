import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/rent/widgets/property_image_view.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class OfficeList extends StatelessWidget {
  const OfficeList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    FavoriteController favoriteController = Get.find();
      return SizedBox(
      height: 288.h,
      width: 300.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Obx(()=> ItemContainer(
            onTapDetails: () {
              HitTestBehavior.opaque;
              Get.toNamed(AppRoutes.rentDetails);
            },
            onTapImage: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(child: PropertyImageView());
                },
              );
            },
            imageHeight: 220.h,
            imageWidth: 300,
            image: ImagesPath.office,
            padding: EdgeInsetsGeometry.only(right: 12.w),
            onVR: () {},
            updateRating: (double value) {
              homeController.officeRating[index]=value;
            },
            initialRating: homeController.officeRating[index], onFavorite: () { favoriteController.selectFavorite(id: index); }, isFavorite: favoriteController.isFavorite(index),
          ),);
        },
      ),
    );
    
  }
}
