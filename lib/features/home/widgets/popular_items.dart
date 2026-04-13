import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/favorite/controllers/add_favorite_controller.dart';
import 'package:renter_pay/features/favorite/controllers/favorite_delete_controller.dart';
import 'package:renter_pay/features/home/controllers/popular_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/features/home/widgets/shadow_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PopularItems extends StatelessWidget {
  final PopularController popularController;
  const PopularItems({super.key, required this.popularController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Property>? properties =
          popularController.popularProperties.value?.data?.data;

      // Don't show if no data
      if (properties == null || properties.isEmpty) {
        return SizedBox.shrink();
      }

      return popularController.isLoading.value
          ? ButtonLoading()
          : Column(
              children: [
                applyPadding(
                  widget: Category(
                    categoryName: 'Popular',
                    categorySlug: 'popular',
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 284.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: properties.length,
                    itemBuilder: (_, index) {
                      Property property = properties[index];
                      final hasImage = property.images?.isNotEmpty ?? false;
                      bool isFirst = index == 0;
                      bool isLast = index == properties.length - 1;
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
                          width: 300.w,
                          margin: EdgeInsets.only(
                            right: isLast ? 8.w : 0.w,
                            left: isFirst ? 20.w : 10.w,
                          ),
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            image: DecorationImage(
                              image: hasImage
                                  ? CachedNetworkImageProvider(
                                      property.images!.first.imagePath
                                          .toString(),
                                    )
                                  : AssetImage(ImagesPath.homeRecommended),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: ShadowContainer(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Obx(
                                        () => CustomFavoriteButton(
                                          onTap: () async {
                                            if (property.isFavourite.value ==
                                                false) {
                                              await Get.find<
                                                    AddFavoriteController
                                                  >()
                                                  .addFavorite(
                                                    propertyID: property.id!,
                                                    index: 1,
                                                  );
                                            } else {
                                              await Get.find<
                                                    DeleteFavoriteController
                                                  >()
                                                  .deleteFavorite(
                                                    propertyID: property.id!,
                                                    index: 1,
                                                  );
                                            }
                                          },
                                          isFavorite:
                                              property.isFavourite.value,
                                        ),
                                      ),
                                    ),
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
                                          text:
                                              '${property.city}, ${property.country}',
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomTextSpan(
                                          title:
                                              '\$${property.units![0].rentAmount}',
                                          spantext: '/Week',
                                          fontSize: 16.sp,
                                          spanFontSize: 12.sp,
                                          spanFontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor,
                                          spanColor:
                                              AppColors.darkSecondaryText,
                                        ),
                                        Image.asset(
                                          IconsPath.appCurrency,
                                          height: 11.h,
                                          width: 11.h,
                                        ),
                                        SizedBox(width: 3.w),
                                        CustomTextSpan(
                                          title:
                                              '${property.units![0].rentAmount}',
                                          spantext: '/Week',
                                          fontSize: 16.sp,
                                          spanFontSize: 12.sp,
                                          spanFontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor,
                                          spanColor:
                                              AppColors.darkSecondaryText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
    });
  }

  Widget applyPadding({required Widget widget}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: widget,
    );
  }
}
