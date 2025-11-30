import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

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
        border: Border.all(width: 0.77, color:isDark? AppColors.darkBorderPrimary: AppColors.filterBorder),
        borderRadius: BorderRadius.circular(9.2.sp),
      ),
      child: Obx((){
        return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilterTitles(
            title: 'Suburb',
            onTap: onTap,
            icon:
              isSearchShow.value ? Icons.remove : Icons.add,
              
          ),
          AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(opacity:isSearchShow.value?1:0, duration: Duration(milliseconds: 200),
          child: isSearchShow.value? Column(
              children: [
                SizedBox(height: 8.44.h),
                SizedBox(
                  height: 41.42.h,
                  width: 223.19.w,
                  child: Material(
                    color: Colors.transparent,
                    child: CustomTextField(
                      controller: textEditingController,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left:12.w),
                        child: Image.asset(
                          IconsPath.homeSearch,
                          height: 18.41.h,
                          width: 18.41.w,
                          color: isDark?AppColors.darkAppBar:null,
                        ),
                      ),
                      textColor: isDark?AppColors.darkAppBar:null,
                      labelText: 'Search Address',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isFilled: true,
                      enableBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.54.sp),
                        borderSide: BorderSide(color:isDark? AppColors.secondaryTextColor: AppColors.filterBorder,)
                      ),
                      focusBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.54.sp),
                        borderSide: BorderSide(color:isDark? AppColors.secondaryTextColor: AppColors.filterBorder,)
                      ),
                      fillColor: isDark? AppColors.darkBorderPrimary: Color(0xFFF6F6F6),
                    ),
                  ),
                ),
                SizedBox(height: 6.13.h),
                Container(
                  height: 88.76,
                  width: 233.19.w,
                  decoration: BoxDecoration(
                    color: isDark?AppColors.darkPrimary:AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(9.2.sp),
                    border: Border.all(width: 0.89, color:isDark?AppColors.darkBorderPrimary: AppColors.whiteLightBorder),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      searchText('Eshelby Drive, Cranbrook', context: context),
                      searchText('Eshelby Drive, Cranbrook', context: context),
                      searchText('Eshelby Drive, Cranbrook', context: context),
                    ],
                  ),
                ),
              ],
            ):SizedBox(),
          ),),
          
        ],
      );
      }),
    );
  }

  Widget searchText(String title,{required BuildContext context}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextSecondary(
      text: title,
      fontSize: 12.27,
      fontWeight: FontWeight.w400,
      color:isDark?AppColors.darkPrimaryText: AppColors.darkContainer,
    );
  }
}
