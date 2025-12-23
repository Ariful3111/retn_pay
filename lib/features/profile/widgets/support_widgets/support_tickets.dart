import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/create_ticket.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_filter.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_table.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SupportTickets extends StatelessWidget {
  const SupportTickets({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return Obx(
      () =>
      AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            final slideTween = Tween<Offset>(
              begin: Offset(0, supportController.isCreateTicket.value ? 0.08 : 0.08),
              end: Offset.zero,
            );

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
               position: slideTween.animate(animation),
                child: child,
              ),
            );
          },
      child:  supportController.isCreateTicket.value
          ? CreateTicket()
          : Column(
              children: [
                Container(
                  height: 176.h,
                  width: MediaQuery.widthOf(context),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextPrimary(
                              text: 'Track & Manage Your\nSupport Tickets',
                              fontSize: 20.sp,
                            ),
                          ),
                          TicketFilter(),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      CustomTextSecondary(
                        text:
                            'Submit a new ticket or check the status of your existing requests.',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 12.h),
                      CustomPrimaryButton(
                        height: 40.h,
                        width: 170.w,
                        textColor: AppColors.darkAppBar,
                        borderRadius: BorderRadius.circular(6.r),
                        text: 'Create New Ticket',
                        onPressed: () {
                          supportController.isCreateTicket.value =
                              !supportController.isCreateTicket.value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                TicketTable(),
              ],
            ),),
    );
  }
}
