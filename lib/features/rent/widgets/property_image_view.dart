import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';

class PropertyImageView extends StatefulWidget {
  final List<String> images;
  final int propertyID;
  const PropertyImageView({
    super.key,
    required this.images,
    required this.propertyID,
  });

  @override
  State<PropertyImageView> createState() => _PropertyImageViewState();
}

class _PropertyImageViewState extends State<PropertyImageView> {
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
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(7.66.sp),
      width: 380.w,
      height: 272.h,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.linear,
            width: 364.w,
            height: 218.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.5.sp),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.5.sp),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.rentDetails,
                    arguments: widget.propertyID,
                  );
                },
                onHorizontalDragEnd: (details) {
                  setState(() {
                    if (details.primaryVelocity! > 0) {
                      // Swipe right - previous image (loop to last if at first)
                      _currentIndex = _currentIndex == 0
                          ? widget.images.length - 1
                          : _currentIndex - 1;
                    } else if (details.primaryVelocity! < 0) {
                      // Swipe left - next image (loop to first if at last)
                      _currentIndex = _currentIndex == widget.images.length - 1
                          ? 0
                          : _currentIndex + 1;
                    }
                  });
                },
                child: CachedNetworkImage(
                  imageUrl: widget.images[_currentIndex],
                  fit: BoxFit.cover,
                  placeholder: (_, __) => _imageLoadingIndicator(size: 22.sp),
                  errorWidget: (_, __, ___) =>
                      _imageLoadingIndicator(size: 22.sp),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                final selectIndex = _currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    height: 25.h,
                    width: 41.w,
                    margin: EdgeInsets.only(
                      right: index < widget.images.length - 1 ? 12.28.w : 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.07.r),
                      border: selectIndex
                          ? Border.all(
                              width: 1.51.r,
                              color: AppColors.lightBorder,
                            )
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.07.r),
                      child: CachedNetworkImage(
                        imageUrl: widget.images[index],
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
      ),
    );
  }
}
