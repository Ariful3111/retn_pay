import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_commit.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_dropdown_menu.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_request_form.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_info.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_widgets.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ServiceSearchDetails extends GetView<ServiceDetailsController> {
  const ServiceSearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceSearchController serviceSearchController = Get.find();
    return Obx(() {
      return CustomContainer(
        padding: EdgeInsets.all(20.r),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground,
        child: controller.isLoading.value
            ? Center(child: ButtonLoading())
            : ListView(
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
                          CustomAppbar(title: 'Services'),
                        ],
                      ),
                      ServiceDropdownMenu(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ServiceSearchInfo(
                    isShow: serviceSearchController.isShowInfo.value,
                    onTap: () {
                      serviceSearchController.isShowInfo.value =
                          !serviceSearchController.isShowInfo.value;
                    },
                    bookButton: true,
                    controller: controller,
                  ),
                  SizedBox(height: 20.h),
                  ServiceDetailsWidgets(
                    widgetList: serviceSearchController.widgetList,
                    widgetTitleList: serviceSearchController.widgetTitle,
                    selectedWidget: serviceSearchController.selectedWidgetList,
                  ),
                  ServiceDetailsCommit(),
                  SizedBox(height: 20.h),
                  ServiceRequestForm(),
                ],
              ),
      );
    });
  }
}
