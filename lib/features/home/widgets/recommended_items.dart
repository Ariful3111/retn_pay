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
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/features/home/widgets/shadow_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class RecommendedItems extends StatelessWidget {
  final RecommendedController recommendedController;
  const RecommendedItems({super.key, required this.recommendedController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Property>? properties =
          recommendedController.recommendedProperties.value?.data?.data;

      // Don't show if no data
      if (properties == null || properties.isEmpty) {
        return SizedBox.shrink();
      }

      return recommendedController.isLoading.value
          ? ButtonLoading()
          : Column(
              children: [
                Category(
                  categoryName: 'Recommended',
                  categorySlug: 'recommended',
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 284.h,
                  width: MediaQuery.widthOf(context),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      Property property = properties[index];
                      Units? unit = (property.units?.isNotEmpty ?? false)
                          ? property.units!.first
                          : null;
                      final hasImage = property.images?.isNotEmpty ?? false;
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Obx(
                                      () => CustomFavoriteButton(
                                        onTap: () async {
                                          if (property.isFavourite.value == false) {
                                            await Get.find<AddFavoriteController>()
                                                .addFavorite(
                                                  propertyID: property.id!,
                                                  index: 0,
                                                );
                                          } else {
                                            await Get.find<
                                                  DeleteFavoriteController
                                                >()
                                                .deleteFavorite(
                                                  propertyID: property.id!,
                                                  index: 0,
                                                );
                                          }
                                        },
                                        isFavorite: property.isFavourite.value,
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
                                      Expanded(
                                        child: CustomTextSecondary(
                                          text:
                                              '${property.city}, ${property.country}',
                                          color: AppColors.whiteColor,
                                          maxLines: 1,
                                          softWrap: false,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 3,
                                        child: CustomTextSpan(
                                          title: '\$${unit?.rentAmount ?? '0'}',
                                          spantext: '/Week',
                                          fontSize: 16.sp,
                                          spanFontSize: 12.sp,
                                          spanFontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor,
                                          spanColor: AppColors.darkSecondaryText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Image.asset(
                                        IconsPath.appCurrency,
                                        height: 11.h,
                                        width: 11.h,
                                      ),
                                      SizedBox(width: 3.w),
                                      Flexible(
                                        flex: 2,
                                        child: CustomTextSpan(
                                          title: unit?.rentAmount ?? '0',
                                          spantext: '/Week',
                                          fontSize: 16.sp,
                                          spanFontSize: 12.sp,
                                          spanFontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor,
                                          spanColor: AppColors.darkSecondaryText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
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
    });
  }
}
