import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class FilterTitles extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final RxBool isShow;
  const FilterTitles({super.key, required this.title, required this.onTap, required this.isShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.primaryText(
              text: title,
              fontSize: 15.34.sp,
              color: Color(0xFF252B37),
            ),
            IconButton(onPressed: 
            onTap, icon: isShow.value? Icon(Icons.remove,color: AppColors.darkPrimary,):Icon(Icons.add,color: AppColors.darkPrimary,)),
          ],
        ),
        Divider(color: Color(0xFFE5E9EE)),
      ],
    );
  }
}
