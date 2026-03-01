import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/service_list_controller.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ServiceReview extends GetWidget<ServiceListController> {
  const ServiceReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : Container(
              padding: EdgeInsets.only(
                left: 16.w,
                top: 16.h,
                bottom: 16.h,
                right: 8.w,
              ),
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.services.value?.data?.data?.length,
                itemBuilder: (context, index) {
                  final service = controller.services.value?.data?.data?[index];
                  if (service == null) return const SizedBox.shrink();
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.serviceSearchDetails,
                          arguments: service.id,
                        );
                      },
                      child: Row(
                        children: [
                          service.logo == null
                              ? Container(
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.39.r),
                                    image: DecorationImage(
                                      image: AssetImage(ImagesPath.service),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.39.r),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        service.logo ?? '',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextPrimary(
                                  text: service.title ?? '',
                                  fontSize: 20.sp,
                                ),
                                SizedBox(height: 4.h),
                                CustomTextSecondary(
                                  text:
                                      service.subtext ??
                                      service.description ??
                                      '',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(height: 8.h),
                                CustomRatingBar(
                                  rating: (service.rating?.averageRating ?? 0)
                                      .toDouble(),
                                  itemSize: 16.sp,
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
            );
    });
  }
}
