import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_faq.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SupportFaq extends StatelessWidget {
  const SupportFaq({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context)),
      ),
      child: Container(
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
            ...List.generate(supportController.fAQ.length, (index) {
              final list = supportController.fAQ[index];
              return Obx(
                () => CustomFaq(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  subFontSize: 12.sp,
                  subFontWeight: FontWeight.w500,
                  title: list['title'],
                  subtitle: list['subTitle'],
                  onTap: () {
                    HitTestBehavior.opaque;
                    supportController.isShowFAQ[index] =
                        !supportController.isShowFAQ[index];
                  },
                  isExpanded: supportController.isShowFAQ[index],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
