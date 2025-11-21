import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';

class PropertyImageView extends StatelessWidget {
  const PropertyImageView({super.key});

  @override
  Widget build(BuildContext context) {
    RentController rentController = Get.find();
    return Container(
      padding: EdgeInsets.all(7.66.sp),
      width: 380.w,
      height: 272.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Obx((){
        return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.linear,
            width: 364.w,
            height: 218.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(rentController.dialogImageList[rentController.dialogImageIndex.value]),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(3.5.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(rentController.dialogImageList.length, (index){
               final selectIndex =rentController.dialogImageIndex.value==index;
              return GestureDetector(
                onTap: () {
                  rentController.dialogSelectedIndex(index);
                },
                child: Container(
                  height: 25.h,
                  width: 41.w,
                  margin: EdgeInsets.only(right: 12.28.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.07.r),
                    image: DecorationImage(image: AssetImage(rentController.dialogImageList[index]),fit: BoxFit.fill),
                    border:selectIndex? Border.all(width: 1.51.r,color: AppColors.lightBorder):null,
                  ),
                ),
              );
            }),
          )
        ],
      );
      }),
    );
  }
}