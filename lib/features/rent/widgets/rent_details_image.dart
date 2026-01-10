import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RentDetailsImage extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const RentDetailsImage({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 190 / 140,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: (propertyDetails.data!.images?.length ?? 0) > 4
          ? 4
          : propertyDetails.data!.images?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.79.r),
            image: DecorationImage(
              image: AssetImage(ImagesPath.apartment),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (index == 3)
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 26.h,
                      width: 108.w,
                      margin: EdgeInsets.only(right: 8.95.w, bottom: 9.89.h),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(50.r),
                        boxShadow: [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconsPath.image,
                            height: 10.18.h,
                            width: 10.18.w,
                          ),
                          CustomTextSecondary(
                            text: 'Explore all photos',
                            fontSize: 8.38,
                            color: AppColors.primaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (index == 2)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 9.59.w, bottom: 8.75.h),
                    child: CustomTextSecondary(
                      text: propertyDetails.data!.address ?? '',
                      fontSize: 8.38,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
