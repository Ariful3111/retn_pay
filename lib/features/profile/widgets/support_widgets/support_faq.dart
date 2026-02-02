import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/faq_controller.dart';
import 'package:renter_pay/shared/widgets/custom_faq.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class SupportFaq extends StatefulWidget {
  const SupportFaq({super.key});

  @override
  State<SupportFaq> createState() => _SupportFaqState();
}

class _SupportFaqState extends State<SupportFaq> {
  final FAQController faqController = Get.find();

  @override
  void initState() {
    super.initState();
    getFAQ();
  }

  void getFAQ() async {
    await faqController.getFAQs(type: "support");
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context)),
      ),
      child: Obx(() {
        if (faqController.isLoading.value) {
          return ButtonLoading();
        }

        final dataList = faqController.faqs.value?.data ?? [];

        if (dataList.isEmpty) {
          return SizedBox.shrink();
        }
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.45.r),
            color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          ),
          child: Column(
            children: [
              CustomTextPrimary(
                text: 'Frequently asked questions',
                fontSize: 20.sp,
              ),
              SizedBox(height: 9.45.h),
              CustomTextSecondary(
                text:
                    'Find quick answers to common questions\nand get the support you need instantly',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14.h),
              ...List.generate(dataList.length, (index) {
                final faq = dataList[index];
                return Obx(
                  () => CustomFaq(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    subFontSize: 12.sp,
                    subFontWeight: FontWeight.w500,
                    title: faq.question ?? "",
                    subtitle: faq.answer ?? "",
                    onTap: () {
                      faqController.toggleExpend(id: faq.id ?? 0);
                    },
                    isExpanded: faqController.expendedIDs.contains(
                      faq.id ?? 0,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
