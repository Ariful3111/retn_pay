import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_upcoming_payment.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_history.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_tab.dart';
import 'package:renter_pay/features/dashboard/widgets/rent_management_widgets/rent_management_table.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class PaymentManagementView extends StatelessWidget {
  const PaymentManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    PaymentManagementController paymentManagementController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          DrawerItemsAppbar(
            title: userIndex == 2 ? 'Rent Management' : 'Payment Management',
          ),
          SizedBox(height: 24.h),
          PaymentTab(),
          SizedBox(height: 20.h),
          Obx(() {
            if (paymentManagementController.paymentTypeIndex.value == 0) {
              return userIndex == 2 || userIndex == 3
                  ? RentManagementTable()
                  : DashboardUpcomingPayment(
                      widget: CustomPrimaryButton(
                        height: 40.h,
                        width: 120.w,
                        borderRadius: BorderRadius.circular(6.r),
                        text: 'Pay Now',
                        textColor: AppColors.darkAppBar,
                        onPressed: () {},
                      ),
                    );
            } else if (paymentManagementController.paymentTypeIndex.value ==
                1) {
              return userIndex == 2 ? RentManagementTable() : PaymentHistory();
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
