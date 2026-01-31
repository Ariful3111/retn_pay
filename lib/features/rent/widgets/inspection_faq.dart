import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/faq_controller.dart';
import 'package:renter_pay/shared/widgets/custom_faq.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class InspectionFaq extends StatefulWidget {
  const InspectionFaq({super.key});

  @override
  State<InspectionFaq> createState() => _InspectionFaqState();
}

class _InspectionFaqState extends State<InspectionFaq> {
  final FAQController faqController = Get.find();

  @override
  void initState() {
    super.initState();
    getFAQ();
  }

  void getFAQ() async {
    await faqController.getFAQs(type: "inspection_request");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (faqController.isLoading.value) {
        return ButtonLoading();
      }

      final dataList = faqController.faqs.value?.data ?? [];

      if (dataList.isEmpty) {
        return SizedBox.shrink();
      }

      return ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final faq = dataList[index];
          return Obx(() {
            return CustomFaq(
              title: faq.question ?? "",
              subtitle: faq.answer ?? "",
              onTap: () {
                faqController.toggleExpend(id: faq.id ?? 0);
              },
              isExpanded: faqController.expendedIDs.contains(faq.id ?? 0),
            );
          });
        },
      );
    });
  }
}
