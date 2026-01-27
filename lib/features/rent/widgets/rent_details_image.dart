import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class RentDetailsImage extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const RentDetailsImage({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    final images = propertyDetails.data?.images ?? const <Images>[];
    final itemCount = images.length > 4 ? 4 : images.length;
    if (itemCount == 0) {
      return SizedBox();
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 190 / 140,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        final imageUrl = images[index].imagePath ?? '';
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (_, __) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.darkPrimary.withValues(alpha: 0.06),
            ),
            child: ButtonLoading(),
          ),
          errorWidget: (_, __, ___) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.darkPrimary.withValues(alpha: 0.06),
            ),
            child: Center(
              child: Icon(
                Icons.broken_image,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (index == 3)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 26.h,
                        width: 108.w,
                        margin: EdgeInsets.only(right: 8.95.w, bottom: 9.89.h),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(offset: Offset(0, 5), blurRadius: 10),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsPath.image,
                              height: 10.18.h,
                              width: 10.18.w,
                            ),
                            CustomTextSecondary(
                              text: 'Explore all photos',
                              fontSize: 8.38,
                              color: AppColors.primaryTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 9.59.w, bottom: 8.75.h),
                    child: CustomTextSecondary(
                      text: images[index].caption ?? '',
                      fontSize: 8.38,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
