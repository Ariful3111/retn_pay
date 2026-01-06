import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landrord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class UpcomingPaymentData extends StatelessWidget {
  const UpcomingPaymentData({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardLandlordController dashboardLandlordController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: List.generate(
            dashboardLandlordController.paymentTableData.length,
            (index) {
              final item = dashboardLandlordController.paymentTableData[index];
              return Container(
                padding: EdgeInsets.only(left: 12.w),
                height: 64.h,
                width: MediaQuery.widthOf(context),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSecondary
                      : AppColors.whiteColor,
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
                      index ==
                              dashboardLandlordController
                                      .paymentTableData
                                      .length -
                                  1
                          ? 12
                          : 0,
                    ),
                    bottomRight: Radius.circular(
                      index ==
                              dashboardLandlordController
                                      .paymentTableData
                                      .length -
                                  1
                          ? 12
                          : 0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cellText(item.address, flex: 3),
                    _cellText(item.date, flex: 2),
                    _cellText(item.amount, flex: 1),
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
