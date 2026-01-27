import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/filter/filter_search_field.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class FilterSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onTap;
  final RxBool isSearchShow;
  const FilterSearch({
    super.key,
    required this.textEditingController,
    required this.onTap,
    required this.isSearchShow,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(18.41.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.77,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.filterBorder,
        ),
        borderRadius: BorderRadius.circular(9.2.sp),
      ),
      child: Obx(() {
        final controller = Get.find<PropertyAddressController>();

        final suggestions = controller.suggestions;
        final isLoading = controller.isLoading.value;
        final shouldShowSuggestions =
            isSearchShow.value && (isLoading || suggestions.isNotEmpty);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilterTitles(
              title: 'Suburb',
              onTap: onTap,
              icon: isSearchShow.value ? Icons.remove : Icons.add,
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: isSearchShow.value ? 1 : 0,
                duration: Duration(milliseconds: 200),
                child: isSearchShow.value
                    ? Column(
                        children: [
                          SizedBox(height: 8.44.h),
                          FilterSearchField(
                            textEditingController: textEditingController,
                          ),
                          SizedBox(height: 6.13.h),
                          if (shouldShowSuggestions)
                            Container(
                              width: 233.19.w,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? AppColors.darkPrimary
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(9.2.sp),
                                border: Border.all(
                                  width: 0.89,
                                  color: isDark
                                      ? AppColors.darkBorderPrimary
                                      : AppColors.whiteLightBorder,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 6.14),
                                    blurRadius: 21.47,
                                    color: AppColors.dropShadowColor.withValues(
                                      alpha: 0.10,
                                    ),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: SizedBox(
                                  height: 90.h,
                                  child: isLoading
                                      ? ButtonLoading()
                                      : ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.h,
                                            horizontal: 10.w,
                                          ),
                                          shrinkWrap: true,
                                          itemCount: suggestions.length,
                                          separatorBuilder: (_, __) => Divider(
                                            height: 12.h,
                                            thickness: 0.5,
                                          ),
                                          itemBuilder: (context, index) {
                                            final item = suggestions[index];
                                            final title = controller
                                                .suggestionTitle(item);
                                            return InkWell(
                                              onTap: () {
                                                FocusScope.of(
                                                  context,
                                                ).unfocus();
                                                controller.selectAddress(item);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 6.h,
                                                ),
                                                child: CustomTextSecondary(
                                                  text: title,
                                                  fontSize: 12.27,
                                                  fontWeight: FontWeight.w400,
                                                  color: isDark
                                                      ? AppColors
                                                            .darkPrimaryText
                                                      : AppColors.darkContainer,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
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
}
