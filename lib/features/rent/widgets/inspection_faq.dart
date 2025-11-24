import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/rent_details_controller.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class InspectionFaq extends StatelessWidget {
  const InspectionFaq({super.key});

  @override
  Widget build(BuildContext context) {
    RentDetailsController rentDetailsController = Get.find();
    
    
      return ListView.builder(
        itemCount: rentDetailsController.faqList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return Obx((){
          return faq(
          title: rentDetailsController.faqList[index]['title'],
          subtitle:
             rentDetailsController.isShowFAQ[index]? "":rentDetailsController.faqList[index]['subtitle'],
          onTap: () {
            rentDetailsController.isShowFAQ[index] =!rentDetailsController.isShowFAQ[index];
          },
          isShow: rentDetailsController.isShowFAQ[index],
        );
        });
      });
  }

  Widget faq({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required bool isShow,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextSecondary(text: title, color: AppColors.primaryTextColor),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                isShow ? Icons.add : Icons.remove,
                size: 15.sp,
                color: AppColors.primaryTextColor,
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
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
