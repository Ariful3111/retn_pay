import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/custom_faq.dart';

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
          return CustomFaq(
          title: propertyViewController.faqList[index]['title'],
          subtitle:
             propertyViewController.isShowFAQ[index]? "":propertyViewController.faqList[index]['subtitle'],
          onTap: () {
            HitTestBehavior.opaque;
            propertyViewController.isShowFAQ[index] =!propertyViewController.isShowFAQ[index];
          },
          isShow: propertyViewController.isShowFAQ[index],
        );
        });
      });
  }

}
