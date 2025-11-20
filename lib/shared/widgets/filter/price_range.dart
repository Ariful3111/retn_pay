import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/filter/custom_slider.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRange extends StatelessWidget {
  final SfRangeValues range;
  final String min;
  final String max;
  final double minRange;
  final double maxRange;
  final ValueChanged<SfRangeValues> onChanged;
  final VoidCallback onTap;
  final RxBool isPriceShow;
  const PriceRange({
    super.key,
    required this.range,
    required this.min,
    required this.max,
    required this.minRange,
    required this.maxRange,
    required this.onChanged,
    required this.onTap,
    required this.isPriceShow,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.41.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.2.sp),
        border: Border.all(
          width: 0.77.sp,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.filterBorder,
        ),
      ),
      child: Obx(() {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.41.w),
              child: FilterTitles(
                title: 'Rent Budget',
                onTap: onTap,
                icon: isPriceShow.value ? Icons.remove : Icons.add,
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: isPriceShow.value ? 1 : 0,
                duration: Duration(milliseconds: 200),
                child: isPriceShow.value
                    ? Column(
                        children: [
                          SizedBox(height: 8.44.h),
                          SizedBox(
                            height: 18.41.h,
                            child: CustomSlider(
                              range: range,
                              minRange: minRange,
                              maxRange: maxRange,
                              onChanged: onChanged,
                            ),
                          ),
                          SizedBox(height: 8.44.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.41.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                showPrice("Minimum", min, context),
                                showPrice("Maximum", max, context),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget showPrice(String text, String price, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 45.h,
      width: 108.53.w,
      padding: EdgeInsets.symmetric(horizontal: 12.27.w, vertical: 6.14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.14.sp),
        color: isDark ? AppColors.darkContainer : Color(0xFFF4F6F8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextSecondary(
            text: text,
            fontSize: 9.2.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF697483),
          ),
          CustomTextPrimary(
            text: price,
            fontSize: 12.27.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
