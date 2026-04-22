import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/favorite/controllers/get_favorite_controller.dart';
import 'package:renter_pay/shared/extensions/formatters/sort_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_item_sort.dart';
import 'package:renter_pay/shared/widgets/custom_pagination.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class FavoriteView extends GetView<GetFavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground.withOpacity(0.5),
        child: controller.isLoading.value
            ? Center(child: ButtonLoading())
            : ListView(
                children: [
                  Row(
                    children: [
                      CustomAppbarLeading(
                        onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 10.w),
                      CustomAppbar(title: 'Favorite'),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  CustomItemSort(
                    title: 'Favorite',
                    info:
                        ' Showing ${controller.favoriteProperties.value?.data?.data?.length ?? 0} result',
                    option: controller.sortList,
                    onSelect: (value) {
                      controller.initialSort.value = value!;
                      final apiSortValue = SortFormatter.toQueryFormat(value);
                      controller.currentPage.value = 1;
                      controller.getFavorite(propertySort: apiSortValue);
                    },
                    isSelect: controller.initialSort,
                  ),
                  SizedBox(height: 20.h),
                  (controller
                              .favoriteProperties
                              .value
                              ?.data
                              ?.data
                              ?.isNotEmpty ??
                          false)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .favoriteProperties
                              .value!
                              .data!
                              .data!
                              .length,
                          itemBuilder: (context, index) {
                            return ItemContainer(
                              imageHeight: 250.h,
                              imageWidth: MediaQuery.widthOf(context),
                              padding: EdgeInsetsGeometry.only(bottom: 20.h),
                              property: controller
                                  .favoriteProperties
                                  .value!
                                  .data!
                                  .data![index],
                            );
                          },
                        )
                      : Center(
                          child: CustomTextPrimary(
                            text: 'No Favorite Item Selected',
                            fontSize: 20.sp,
                          ),
                        ),
                  SizedBox(height: 20.h),
                  Obx(() {
                    final lastPage = controller.totalPage.value;

                    // Show pagination only if more than 1 page exists
                    if (lastPage <= 1) {
                      return SizedBox.shrink();
                    }

                    return CustomPagination(
                      list: controller.pageNumber,
                      onTapPrev: controller.previousPage,
                      onTapNext: controller.nextPage,
                      onTapPage: (item) {
                        controller.currentPage.value = item;
                      },
                      value: controller.currentPage.value,
                    );
                  }),
                  SizedBox(height: 60.h),
                ],
              ),
      );
    });
  }
}
