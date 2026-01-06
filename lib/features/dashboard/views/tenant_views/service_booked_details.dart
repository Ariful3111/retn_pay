import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_complete.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_request.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_commit.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_widgets.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_dropdown_menu.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_info.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ServiceBookedDetails extends StatelessWidget {
  const ServiceBookedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceBookedDetailsController serviceBookedDetailsController = Get.find();
    ServiceSearchController serviceSearchController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomAppbarLeading(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8.w),
                  CustomAppbar(title: 'Booked Services'),
                ],
              ),
              ServiceDropdownMenu(),
            ],
          ),
          SizedBox(height: 16.h),
         Obx(()=> ServiceSearchInfo(
            isShow: serviceBookedDetailsController.isShowInfo.value,
            onTap: () {
              serviceBookedDetailsController.isShowInfo.value =
                  !serviceBookedDetailsController.isShowInfo.value;
            }, bookButton: false,
          ),),
          SizedBox(height: 20.h),
          ServiceDetailsWidgets(
            widgetList: serviceSearchController.widgetList,
            widgetTitleList: serviceSearchController.widgetTitle,
            selectedWidget: serviceBookedDetailsController.selectedWidgetList,
          ),
          SizedBox(height: 20.h),
          ServiceDetailsCommit(),
          SizedBox(height: 20.h),
          ServiceBookedRequest(),
          SizedBox(height: 20.h,),
          ServiceBookedComplete() 
        ],
      ),
    );
  }
}
