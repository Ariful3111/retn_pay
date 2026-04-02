import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controllers/add_favorite_controller.dart';
import 'package:renter_pay/features/favorite/controllers/favorite_delete_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/rent/widgets/property_image_view.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_favorite_button.dart';
import 'package:renter_pay/shared/widgets/item_info.dart';

class ItemContainer extends StatelessWidget {
  final Property property;
  final double imageHeight;
  final double imageWidth;
  final EdgeInsetsGeometry padding;
  final int favoriteIndex;

  const ItemContainer({
    super.key,
    required this.imageHeight,
    required this.imageWidth,
    required this.padding,
    required this.property,
    this.favoriteIndex = 2, // Default to 2 (home view)
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: PropertyImageView(
                      images: property.images!
                          .map((e) => e.imagePath.toString())
                          .toList(),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: imageHeight,
              width: imageWidth,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    property.images?.first.imagePath ?? '',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Obx(
                  () => CustomFavoriteButton(
                    onTap: () async {
                      if (property.isFavourite.value == false) {
                        await Get.find<AddFavoriteController>().addFavorite(
                          propertyID: property.id!,
                          index: favoriteIndex,
                        );
                      } else {
                        await Get.find<DeleteFavoriteController>()
                            .deleteFavorite(
                              propertyID: property.id!,
                              index: favoriteIndex,
                            );
                      }
                    },
                    isFavorite: property.isFavourite.value,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          ItemInfo(
            property: property,
            initialRating: double.parse(property.rating ?? '0'),
            imageWidth: imageWidth,
          ),
        ],
      ),
    );
  }
}
