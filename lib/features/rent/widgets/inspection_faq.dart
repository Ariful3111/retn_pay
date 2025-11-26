import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionFaq extends StatelessWidget {
  const InspectionFaq({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyViewController propertyViewController = Get.find();
      return ListView.builder(
        itemCount: propertyViewController.faqList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return Obx((){
          return faq(
          title: propertyViewController.faqList[index]['title'],
          subtitle:
             propertyViewController.isShowFAQ[index]? "":propertyViewController.faqList[index]['subtitle'],
          onTap: () {
            propertyViewController.isShowFAQ[index] =!propertyViewController.isShowFAQ[index];
          },
          isShow: propertyViewController.isShowFAQ[index], context: context,
        );
        });
      });
  }

  Widget faq({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required bool isShow,
    required BuildContext context,
  }) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextSecondary(text: title, color:isDark?AppColors.darkSecondaryText: AppColors.primaryTextColor),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                isShow ? Icons.add : Icons.remove,
                size: 15.sp,
                color:isDark?AppColors.darkSecondaryText: AppColors.primaryTextColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.w,),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          child: CustomTextSecondary(
            text: subtitle,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color:isDark?AppColors.darkSecondaryText: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
