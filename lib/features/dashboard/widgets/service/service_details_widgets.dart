import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_switcher.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceDetailsWidgets extends StatelessWidget {
  final List<Widget> widgetList;
  final List<String> widgetTitleList;
  final RxInt widgetIndex;
  const ServiceDetailsWidgets({
    super.key,
    required this.widgetList,
    required this.widgetTitleList,
    required this.widgetIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(()=> Column(
      children: List.generate(widgetList.length, (index) {
        final isSelected = widgetIndex.value == index;
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextPrimary(
                        text: widgetTitleList[index],
                        fontSize: 20.sp,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkContainer,
                      ),
                      ServiceDetailsSwitcher(
                        isShow: isSelected,
                        onTap: () {
                          widgetIndex.value = isSelected ? -1 : index;
                        },
                      ),
                    ],
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: isSelected
                        ? widgetList[index]
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        );
      }),
    ),);
  }
}
