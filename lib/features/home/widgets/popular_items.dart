import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_favorite_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();
    return SizedBox(
      height: 284.w,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              HitTestBehavior.opaque;
              Get.toNamed(AppRoutes.rentDetails);
            },
            child: Container(
              height: 284.h,
              width: 300.w,
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                image: DecorationImage(
                  image: AssetImage(ImagesPath.homePopular),
                  fit: BoxFit.fill,
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
                          favoriteController.selectFavorite(id: index);
                        },
                        isFavorite: favoriteController.isFavorite(index),
                      ),
                    );
                  }),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextSecondary(
                        text: 'Maple Grove Garden',
                        color: AppColors.whiteColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextSpan(
                            title: '\$200',
                            spantext: '/Week',
                            fontSize: 16.sp,
                            spanFontSize: 12.sp,
                            spanFontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                            spanColor: AppColors.darkSecondaryText,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                IconsPath.appCurrency,
                                height: 11.h,
                                width: 11.h,
                              ),
                              SizedBox(width: 3.w),
                              CustomTextSpan(
                                title: '200',
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
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        IconsPath.location,
                        height: 14.h,
                        width: 14.w,
                      ),
                      SizedBox(width: 4.w),
                      CustomTextSecondary(
                        text: 'New York, USA',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor.withValues(alpha: 0.75),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
