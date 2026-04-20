import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';

class RentDetailsImage extends StatefulWidget {
  final PropertyDetailsModel propertyDetails;
  const RentDetailsImage({super.key, required this.propertyDetails});

  @override
  State<RentDetailsImage> createState() => _RentDetailsImageState();
}

class _RentDetailsImageState extends State<RentDetailsImage> {
  int _currentIndex = 0;

  Widget _imageLoadingIndicator({double? size}) {
    return Center(
      child: SizedBox(
        height: size ?? 18.sp,
        width: size ?? 18.sp,
        child: CircularProgressIndicator(
          strokeWidth: 2.sp,
          color: AppColors.primaryColorDark,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.propertyDetails.data?.images ?? const <Images>[];
    if (images.isEmpty) {
      return SizedBox();
    }

    final imageUrls = images.map((img) => img.imagePath ?? '').toList();

    return Column(
      children: [
        // Main large image with swipe gesture
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.linear,
          width: double.infinity,
          height: 218.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (details.primaryVelocity! > 0) {
                    // Swipe right - previous image (loop to last if at first)
                    _currentIndex = _currentIndex == 0
                        ? imageUrls.length - 1
                        : _currentIndex - 1;
                  } else if (details.primaryVelocity! < 0) {
                    // Swipe left - next image (loop to first if at last)
                    _currentIndex = _currentIndex == imageUrls.length - 1
                        ? 0
                        : _currentIndex + 1;
                  }
                });
              },
              child: CachedNetworkImage(
                imageUrl: imageUrls[_currentIndex],
                fit: BoxFit.cover,
                placeholder: (_, __) => _imageLoadingIndicator(size: 22.sp),
                errorWidget: (_, __, ___) =>
                    _imageLoadingIndicator(size: 22.sp),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        // Thumbnail row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageUrls.length, (index) {
              final selectIndex = _currentIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Container(
                  height: 50.h,
                  width: 70.w,
                  margin: EdgeInsets.only(
                    right: index < imageUrls.length - 1 ? 10.w : 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: selectIndex
                        ? Border.all(
                            width: 2.r,
                            color: AppColors.primaryColorDark,
                          )
                        : null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      fit: BoxFit.cover,
                      placeholder: (_, __) => _imageLoadingIndicator(),
                      errorWidget: (_, __, ___) => _imageLoadingIndicator(),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
