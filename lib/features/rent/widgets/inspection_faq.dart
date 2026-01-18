import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/inspection_from_controller.dart';
import 'package:renter_pay/shared/widgets/custom_faq.dart';

class InspectionFaq extends StatelessWidget {
  const InspectionFaq({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionFromController inspectionFromController = Get.find();
      return ListView.builder(
        itemCount: inspectionFromController.faqList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return Obx((){
          return CustomFaq(
          title: inspectionFromController.faqList[index]['title'],
          subtitle:
             inspectionFromController.isShowFAQ[index]? "":inspectionFromController.faqList[index]['subtitle'],
          onTap: () {
            inspectionFromController.isShowFAQ[index] =!inspectionFromController.isShowFAQ[index];
          },
          isShow: inspectionFromController.isShowFAQ[index],
        );
        });
      });
  }

}
