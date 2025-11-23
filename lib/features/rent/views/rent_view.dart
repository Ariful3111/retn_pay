import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
import 'package:renter_pay/shared/widgets/custom_pagination.dart';
import 'package:renter_pay/features/rent/widgets/property_image_view.dart';
import 'package:renter_pay/shared/widgets/custom_item_sort.dart';
import 'package:renter_pay/features/rent/widgets/rent_app_bar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class RentView extends StatelessWidget {
  const RentView({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalScrollController globalScrollController = Get.find();
    FavoriteController favoriteController = Get.find();
    RentController rentController = Get.find();
     bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient:isDark? LinearGradient(colors: [
        AppColors.darkPrimary,
        AppColors.darkPrimary,
      ]):AppColors.userBackground.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        controller: globalScrollController.scrollController,
        child: Column(
          children: [
            RentAppBar(),
            SizedBox(height: 8.h),
            CustomItemSort(onItemSort: () { 
            },title: 'Property',),
            SizedBox(height: 19.28.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
                itemBuilder: (_, index) {
                  return ItemContainer(
                    onTapImage: () {
                      showDialog(context: context, builder: (context){
                        return Dialog(child: PropertyImageView());
                      });
                    },
                    onTapDetails: () {
                      HitTestBehavior.opaque;
                      Get.toNamed(AppRoutes.rentDetails);
                    },
                    imageHeight: 250.h,
                    imageWidth: MediaQuery.widthOf(context),
                    image: ImagesPath.house,
                    padding: EdgeInsetsGeometry.only(bottom: 24.h),
                    onVR: () {},
                    updateRating: (value) {
                      rentController.houseRating[index] = value;
                    },
                    initialRating: rentController.houseRating[index], onFavorite: () {  }, isFavorite: favoriteController.isFavorite(index),
                  );
                },
              ),
              CustomPagination(),
              SizedBox(height: 55.h,),
          ],
        ),
      ),
    );
  }
}
