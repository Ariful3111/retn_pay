import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_favorite_button.dart';
import 'package:renter_pay/shared/widgets/item_info.dart';

class ItemContainer extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String image;
  final double? borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback onVR;
  final ValueChanged<double> updateRating;
  final double initialRating;
  final VoidCallback? onTapImage;
  final VoidCallback? onTapDetails;
  final VoidCallback onFavorite;
  final bool isFavorite;
  final BoxFit? fit;
  const ItemContainer({
    super.key,
    required this.imageHeight,
    required this.imageWidth,
    required this.image,
    this.borderRadius,
    required this.padding,
    required this.onVR,
    required this.updateRating,
    required this.initialRating,
    this.onTapImage,
    required this.onFavorite,
    required this.isFavorite,
    this.onTapDetails, this.fit,
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
            onTap: onTapImage,
            child: Container(
              height: imageHeight,
              width: imageWidth,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 12.sp),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit:fit?? BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: CustomFavoriteButton(
                  onTap: onFavorite,
                  isFavorite: isFavorite,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          ItemInfo(
            onVR: onVR,
            updateRating: updateRating,
            initialRating: initialRating,
            onTapDetails: onTapDetails,
          ),
        ],
      ),
    );
  }
}
