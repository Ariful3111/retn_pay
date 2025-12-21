import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/contact_support.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/support_faq.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/support_tickets.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 8.w),
              CustomAppbar(title: 'Support'),
            ],
          ),
          SizedBox(height: 24.h,),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(4.r),
              width: 292.w,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.darkAppIcon
                    : LinearGradient(
                        colors: [AppColors.whiteColor, AppColors.whiteColor],
                      ),
                borderRadius: BorderRadius.circular(9.63.r),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(supportController.supportType.length, (
                    index,
                  ) {
                    bool isSelect =
                        supportController.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        supportController.selectedIndex.value = index;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.42.r),
                          color: isSelect?AppColors.primaryColorDark:null,
                        ),
                        child: Center(child: CustomTextSecondary(text: supportController.supportType[index],fontSize: 14.sp,color: isSelect?AppColors.whiteColor:isDark? AppColors.darkPrimary:null,),),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h,),
          Obx(() => Column(
            children: [
              if(supportController.selectedIndex.value==0) SupportFaq(),
              if(supportController.selectedIndex.value==1) SupportTickets(),
              if(supportController.selectedIndex.value==2) ContactSupport(),
            ],
          ),)
        ],
      ),
    );
  }
}
