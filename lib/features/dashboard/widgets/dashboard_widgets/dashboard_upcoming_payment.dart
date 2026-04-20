import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/upcoming_payments_model.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/upcoming_payment_info.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class DashboardUpcomingPayment extends GetWidget<UpcomingPaymentController> {
  final Widget? widget;
  const DashboardUpcomingPayment({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      // Get first upcoming payment from the list
      UpcomingPayment? firstPayment =
          controller.upcomingPayments.value?.data?.firstOrNull;

      return controller.isLoading.value
          ? ButtonLoading()
          : firstPayment == null
          ? SizedBox() // No data
          : MediaQuery(
              data: MediaQueryData(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 24.h),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSecondary
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPrimary(
                      text: 'Upcoming Payment',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.darkAppBar
                          : AppColors.primaryColorDark,
                    ),
                    SizedBox(height: 16.42.h),
                    // Property images row
                    Row(
                      children: List.generate(
                        firstPayment.leaseAgreement?.property != null ? 3 : 0,
                        (index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: index == 2 ? 0 : 12.w,
                            ),
                            height: 82.11.h,
                            width: 102.63.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImagesPath.house),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8.21.r),
                            ),
                          );
                        },
                      ),
                    ),
                    UpcomingPaymentInfo(payment: firstPayment, widget: widget),
                  ],
                ),
              ),
            );
    });
  }
}
