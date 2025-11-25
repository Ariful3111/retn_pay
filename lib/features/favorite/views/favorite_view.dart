import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_item_sort.dart';
import 'package:renter_pay/shared/widgets/custom_pagination.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();
    HomeController homeController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gradient:isDark? LinearGradient(colors: [
        AppColors.darkPrimary,
        AppColors.darkPrimary,
      ]):AppColors.userBackground.withOpacity(0.5),
      child: ListView(
        children: [
      Row(children: [
            CustomAppbarLeading(onTap: () {
              Get.back();
            },
            ),
            SizedBox(width: 10.w,),
            CustomAppbar(title: 'Favorite'),
          ],),
          SizedBox(height: 8.h),
          CustomItemSort(title: 'Favorite', onItemSort: () {
          },),
          SizedBox(height: 20.h,),
          favoriteController.favoriteItem.isNotEmpty? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: favoriteController.favoriteItem.length,
            itemBuilder: (context,index){
            return ItemContainer(imageHeight: 250.h, imageWidth: MediaQuery.widthOf(context), image: ImagesPath.office, padding: EdgeInsetsGeometry.only(bottom: 20.h), onVR: () {
              
            }, updateRating: (value) {
              homeController.houseRating[index]=value;
            }, initialRating: homeController.houseRating[index], onFavorite: () {
              favoriteController.favoriteItem.contains(index);
            }, isFavorite: favoriteController.isFavorite(index));
          }):Center(child: CustomTextPrimary(text: 'No Favorite Item Selected',fontSize: 20.sp,),),
          SizedBox(height: 20.h,),
         if(favoriteController.favoriteItem.isNotEmpty) CustomPagination(),
          SizedBox(height: 60.h,),
        ],
      ),
    );
  }
}