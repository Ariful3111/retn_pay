import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

class FilterSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onTap;
  final RxBool isSearchShow;
  const FilterSearch({super.key, required this.textEditingController, required this.onTap, required this.isSearchShow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.41.h),
      height: 215.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(width: 0.77,color: AppColors.filterBorder),
        borderRadius: BorderRadius.circular(9.2.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilterTitles(title: 'Suburb', onTap: onTap, isShow: isSearchShow,),
          Container(
            padding: EdgeInsets.all(12.27.sp),
            height: 41.42.h,
            width: 223.19.w,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              border: Border.all(width: 0.77,color: AppColors.filterBorder),
              borderRadius: BorderRadius.circular(24.54.sp),
            ),
            child: Material(
              color: Colors.transparent,
              child: CustomTextField(
                controller: textEditingController,
                prefixIcon: Image.asset(IconsPath.homeSearch,height: 18.41.h,width: 18.41.w,),
                labelText: 'Search Address',
              ),
            ),
          ),
          SizedBox(height: 6.13.h,),
          Container(
            height: 88.76,
            width:  233.19.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(9.2.sp),
              border: Border.all(width: 0.89,color: Color(0xFFF1F1F2)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 6.14),
                  blurRadius: 21.47,
                  color:AppColors.dropShadowColor.withValues(alpha: 0.10),
                ),
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                searchText('Eshelby Drive, Cranbrook'),
                searchText('Eshelby Drive, Cranbrook'),
                searchText('Eshelby Drive, Cranbrook'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget searchText(String title){
    return CustomText.secondaryText(text: title,fontSize: 12.27,fontWeight: FontWeight.w400,color: Color(0xFF091E42));
  }
}