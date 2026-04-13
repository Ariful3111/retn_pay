import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/widgets/category.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class ApartmentList extends StatelessWidget {
  final HomeController homeController;
  const ApartmentList({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return homeController.apartmentProperties.isEmpty
        ? SizedBox()
        : Column(
            children: [
              applyPadding(
                widget: Category(
                  categoryName: 'Apartment',
                  categorySlug: 'apartment',
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 302.h,
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.apartmentProperties.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    Property property =
                        homeController.apartmentProperties[index];
                    bool isFirst = index == 0;
                    bool isLast =
                        index == homeController.apartmentProperties.length - 1;
                    return ItemContainer(
                      property: property,
                      imageHeight: 220.h,
                      imageWidth: 300.w,
                      padding: EdgeInsets.only(
                        right: isLast ? 15.w : 0.w,
                        left: isFirst ? 12.w : 5.w,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }

  Widget applyPadding({required Widget widget}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: widget,
    );
  }
}
