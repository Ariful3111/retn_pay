import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class RecommendedItems extends StatelessWidget {
  final HomeController homeController;
  const RecommendedItems({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();
    return homeController.recommendedProperties.isEmpty
        ? SizedBox()
        : Column(
            children: [
              Category(categoryName: 'Recommended', onTap: () {}),
              SizedBox(height: 16.h),
              SizedBox(
                height: 284.h,
                width: MediaQuery.widthOf(context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: homeController.recommendedProperties.length,
                  itemBuilder: (context, index) {
                    Property property =
                        homeController.recommendedProperties[index];
                    return GestureDetector(
                      onTap: () {
                        HitTestBehavior.opaque;
                        Get.toNamed(
                          AppRoutes.rentDetails,
                          arguments: property.id,
                        );
                      },
                      child: Container(
                        height: 284.h,
                        width: 189.w,
                        margin: EdgeInsets.only(right: 12.w),
                        padding: EdgeInsets.only(
                          left: 12.w,
                          right: 8.w,
                          top: 8.h,
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              property.images![0].imagePath.toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return Align(
                                alignment: Alignment.topRight,
                                child: CustomFavoriteButton(
                                  onTap: () {
                                    favoriteController.selectFavorite(
                                      id: index,
                                    );
                                  },
                                  isFavorite: favoriteController.isFavorite(
                                    index,
                                  ),
                                ),
                              );
                            }),
                            Spacer(),

                            Row(
                              children: [
                                Image.asset(
                                  IconsPath.location,
                                  height: 14.h,
                                  width: 14.w,
                                ),
                                SizedBox(width: 4.w),
                                CustomTextSecondary(
                                  text: '${property.city}, ${property.country}',
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomTextSpan(
                                  title:
                                      '\$${property.units![0].rentAmount.toString()}',
                                  spantext: '/Week',
                                  fontSize: 16.sp,
                                  spanFontSize: 12.sp,
                                  spanFontWeight: FontWeight.w400,
                                  color: AppColors.whiteColor,
                                  spanColor: AppColors.darkSecondaryText,
                                ),
                                SizedBox(width: 5.w),
                                Image.asset(
                                  IconsPath.appCurrency,
                                  height: 11.h,
                                  width: 11.h,
                                ),
                                SizedBox(width: 3.w),
                                CustomTextSpan(
                                  title: property.units![0].rentAmount
                                      .toString(),
                                  spantext: '/Week',
                                  fontSize: 16.sp,
                                  spanFontSize: 12.sp,
                                  spanFontWeight: FontWeight.w400,
                                  color: AppColors.whiteColor,
                                  spanColor: AppColors.darkSecondaryText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
            ],
          );
  }
}
