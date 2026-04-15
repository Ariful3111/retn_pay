import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UpcomingPaymentData extends GetWidget<UpcomingPaymentController> {
  const UpcomingPaymentData({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: List.generate(
          controller.upcomingPayments.value?.data?.length ?? 0,
          (index) {
            final item = controller.upcomingPayments.value?.data?[index];
            return Container(
              padding: EdgeInsets.only(left: 12.w),
              height: 64.h,
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                border: Border(
                  bottom: BorderSide(
                    width: 1.r,
                    color: isDark
                        ? AppColors.darkBorderPrimary
                        : AppColors.primaryBorder,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    index == controller.upcomingPayments.value!.data!.length - 1
                        ? 12
                        : 0,
                  ),
                  bottomRight: Radius.circular(
                    index == controller.upcomingPayments.value!.data!.length - 1
                        ? 12
                        : 0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _cellText(
                    item?.leaseAgreement?.property?.address ?? "",
                    flex: 3,
                  ),
                  _cellText(
                    item!
                            .leaseAgreement
                            ?.agreementDetails
                            ?.basicTerms
                            ?.rent
                            ?.rentDueDate ??
                        "",
                    flex: 2,
                  ),
                  _cellText(item.amount ?? "", flex: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _cellText(
    String text, {
    required int flex,
    bool alignRight = false,
    bool alignCenter = false,
  }) {
    return Expanded(
      flex: flex,
      child: CustomTextSecondary(
        text: text,
        textAlign: alignCenter
            ? TextAlign.center
            : (alignRight ? TextAlign.right : TextAlign.left),
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
    );
  }
}
