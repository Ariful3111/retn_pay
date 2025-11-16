import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

class FilterSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onTap;
  const FilterSearch({super.key, required this.textEditingController, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
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
          FilterTitles(title: 'Suburb', onTap: onTap,),
          Container(
            padding: EdgeInsets.all(12.27.sp),
            height: 41.42.h,
            width: 223.19.w,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              border: Border.all(width: 0.77,color: AppColors.filterBorder),
              borderRadius: BorderRadius.circular(24.54.sp),
            ),
            child: Center(
              child: CustomTextField(
                controller: textEditingController,
                prefixIcon: Image.asset(IconsPath.homeSearch,height: 18.41.h,width: 18.41.w,),
                labelText: 'Search Address',
              ),
            ),
          ),
        ],
      ),
    );
  }
}