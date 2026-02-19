import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
import 'package:renter_pay/shared/widgets/custom_pagination.dart';
import 'package:renter_pay/shared/widgets/custom_item_sort.dart';
import 'package:renter_pay/features/rent/widgets/rent_app_bar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class RentView extends GetView<RentController> {
  const RentView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : CustomContainer(
              gradient: isDark
                  ? LinearGradient(
                      colors: [AppColors.darkPrimary, AppColors.darkPrimary],
                    )
                  : AppColors.userBackground.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    RentAppBar(),
                    SizedBox(height: 8.h),
                    CustomItemSort(
                      title: 'Property',
                      option: controller.sortList,
                      info: "",
                      onSelect: (value) {
                        controller.initialSort.value = value!;
                      },
                      isSelect: controller.initialSort,
                    ),
                    SizedBox(height: 20.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.rents.value?.data?.data?.length ?? 0,
                      itemBuilder: (_, index) {
                        final property =
                            controller.rents.value?.data?.data?[index].property;
                        return ItemContainer(
                          imageHeight: 250.h,
                          imageWidth: MediaQuery.widthOf(context),
                          padding: EdgeInsetsGeometry.only(bottom: 24.h),
                          property: property ?? Property(),
                        );
                      },
                    ),
                    controller.rents.value?.data?.data?.isEmpty == true
                        ? SizedBox.shrink()
                        : CustomPagination(
                            list: controller.pageNumber,
                            onTapPrev: controller.previousPage,
                            onTapNext: controller.nextPage,
                            onTapPage: (item) {
                              controller.currentPage.value = item;
                              controller.getRentList(page: item);
                            },
                            value: controller.currentPage.value,
                          ),
                    SizedBox(height: 55.h),
                  ],
                ),
              ),
            );
    });
  }
}
