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

class RentView extends StatelessWidget {
  const RentView({super.key});
  @override
  Widget build(BuildContext context) {
    RentController rentController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        controller: rentController.scrollController,
        child: Column(
          children: [
            RentAppBar(),
            SizedBox(height: 8.h),
            CustomItemSort(
              title: 'Property',
              option: rentController.sortList,
              info: "",
              onSelect: (value) {
                rentController.initialSort.value = value!;
              },
              isSelect: rentController.initialSort,
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (_, index) {
                return ItemContainer(
                  imageHeight: 250.h,
                  imageWidth: MediaQuery.widthOf(context),
                  padding: EdgeInsetsGeometry.only(bottom: 24.h),
                  property: Property(),
                );
              },
            ),
            Obx(
              () => CustomPagination(
                list: rentController.pageNumber,
                onTapPrev: rentController.previousPage,
                onTapNext: rentController.nextPage,
                onTapPage: (item) {
                  rentController.currentPage.value = item;
                },
                value: rentController.currentPage.value,
              ),
            ),
            SizedBox(height: 55.h),
          ],
        ),
      ),
    );
  }
}
