import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/rent_notice_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/notice_button.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class DashboardRentNotice extends GetWidget<RentNoticeController> {
  const DashboardRentNotice({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final notices = controller.rentNotices.value?.data?.data;
      final notice = (notices == null || notices.isEmpty)
          ? null
          : notices.first;
      final currencySymbol =
          notice?.leaseAgreement?.currencyDetail?.symbol ?? '\$';
      final effectiveDate = (notice?.effectiveDate).toDMMMyyyy().replaceAll(
        ',',
        '',
      );
      final noticeInfoList = [
        'Current Rent: $currencySymbol${notice?.currentRent ?? ''}',
        'New Rent Amount: $currencySymbol${notice?.newRentAmount ?? ''}',
        'Effective Date: $effectiveDate',
      ];

      return controller.isLoading.value
          ? ButtonLoading()
          : notice == null
          ? SizedBox.shrink()
          : Container(
              height: 295.h,
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Container(
                    height: 8.72.h,
                    width: MediaQuery.widthOf(context),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 11.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextSecondary(
                          text: 'Rent Adjustment Notice',
                          fontSize: 20.sp,
                        ),
                        SizedBox(height: 17.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImagesPath.house,
                              height: 43.58.h,
                              width: 43.58.w,
                            ),
                            SizedBox(width: 13.07.w),
                            CustomTextPrimary(
                              text: 'Apt 102 Green Street',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 17.43.h),
                        ...List.generate(noticeInfoList.length, (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.71.h),
                            child: CustomTextSecondary(
                              text: noticeInfoList[index],
                            ),
                          );
                        }),
                        SizedBox(height: 17.43.h),
                        NoticeButton(),
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
