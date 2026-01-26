import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';

class PropertyImageView extends GetView<RentController> {
  final List<String> images;
  const PropertyImageView({super.key, required this.images});

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
    controller.dialogSelectedIndex(0);

    return Container(
      padding: EdgeInsets.all(7.66.sp),
      width: 380.w,
      height: 272.h,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Obx(() {
        return Column(
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
                child: CachedNetworkImage(
                  imageUrl: images[controller.dialogImageIndex.value],
                  fit: BoxFit.fill,
                  placeholder: (_, __) => _imageLoadingIndicator(size: 22.sp),
                  errorWidget: (_, __, ___) =>
                      _imageLoadingIndicator(size: 22.sp),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  final selectIndex =
                      controller.dialogImageIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      controller.dialogSelectedIndex(index);
                    },
                    child: Container(
                      height: 25.h,
                      width: 41.w,
                      margin: EdgeInsets.only(right: 12.28.w),
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
                          imageUrl: images[index],
                          fit: BoxFit.fill,
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
      }),
    );
  }
}
