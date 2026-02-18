import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/create_ticket_field.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_priority_selector.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attached_image.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class CreateTicket extends GetWidget<SupportController> {
  const CreateTicket({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(20.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Column(
        children: [
          CustomTextPrimary(text: 'Create New Ticket', fontSize: 20.sp),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: 'Submit a new support or maintenance request using the form.',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          CreateTicketField(),
          TicketPrioritySelector(),
          SizedBox(height: 20.h),
          CustomAttachedImage(imageList: controller.uploadImage),
          SizedBox(height: 20.h),
          Obx(() {
            return controller.isSubmitLoading.value
                ? ButtonLoading()
                : CustomPrimaryButton(
                    height: 48.h,
                    text: 'Submit Ticket',
                    onPressed: () async {

                      await controller.submitSupportTicket();
                    },
                  );
          }),
        ],
      ),
    );
  }
}
