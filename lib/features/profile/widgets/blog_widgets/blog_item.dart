import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/controllers/blog_controller.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class BlogItem extends GetWidget<BlogController> {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.blogs.value?.data?.length ?? 0,
              itemBuilder: (context, index) {
                final blog = controller.blogs.value?.data?[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.blogDetails);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 14.44.h),
                    padding: EdgeInsets.all(14.r),
                    width: MediaQuery.widthOf(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        width: 1.r,
                        color: isDark
                            ? AppColors.darkContainer
                            : AppColors.whiteBorder,
                      ),
                      color: isDark
                          ? AppColors.darkPrimary
                          : AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5.78),
                          blurRadius: 20.22,
                          color: AppColors.dropShadowColor.withValues(
                            alpha: 0.10,
                          ),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 158.88.h,
                          width: MediaQuery.widthOf(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                blog?.featuredImage ?? '',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextSecondary(
                              text: blog?.publishedAt.toDMMMyyyy() ?? '',
                              fontSize: 12.sp,
                              color: AppColors.darkLightText,
                            ),
                            CustomTextSecondary(
                              text: '2 min read',
                              fontSize: 12.sp,
                              color: AppColors.darkLightText,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.67.h),
                        CustomTextPrimary(
                          text: blog?.title ?? '',
                          fontSize: 18.sp,
                        ),
                        SizedBox(height: 5.78),
                        CustomTextSecondary(
                          text: blog?.excerpt ?? '',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 5.78),
                        Row(
                          children: [
                            Image.asset(
                              IconsPath.pen,
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 5.78.w),
                            CustomTextSecondary(
                              text: blog!.author!.name.toString() == "null"
                                  ? 'By RenterPay Team'
                                  : blog.author!.name.toString(),
                              fontSize: 12.sp,
                              color: isDark
                                  ? Color(0xFFFAFBFB)
                                  : AppColors.darkContainer,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
