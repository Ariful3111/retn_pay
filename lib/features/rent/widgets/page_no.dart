import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class PageNo extends StatelessWidget {
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;
  final bool isSelect;
  final Function(int) onPageTap;
  const PageNo({
    super.key,
    required this.onPreviousPage,
    required this.onNextPage,
    required this.onPageTap,
    required this.isSelect,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pageButton(
          96.88.w,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IconsPath.arrowLeft, height: 15.31.h, width: 15.31.w),
              SizedBox(width: 6.12.w),
              CustomText.primaryText(
                text: 'Previous',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          onTap: onPreviousPage,
        ),
        pageNumberButton('1', isSelect),
        pageButton(
          73.86.w,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.primaryText(
                text: 'Next',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 6.12.w),
              Image.asset(
                IconsPath.arrowRight,
                height: 15.31.h,
                width: 15.31.w,
                color: AppColors.darkPrimary,
              ),
            ],
          ),
          onTap: onNextPage,
        ),
      ],
    );
  }

  Widget pageButton(double width, Widget child, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33.25.h,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.12.sp),
          border: Border.all(
            width: 0.77.sp,
            color: AppColors.darkPrimary.withValues(alpha: 0.10),
          ),
        ),
        child: child,
      ),
    );
  }

  Widget pageNumberButton(String pageNo, bool isSelect) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelect ? AppColors.primaryTextColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        pageNo,
        style: TextStyle(color: isSelect ? Colors.white : Colors.black),
      ),
    );
  }
}
