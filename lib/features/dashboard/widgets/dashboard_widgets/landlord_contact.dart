import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/services/url_service.dart';
import 'package:renter_pay/features/chat/controllers/create_chat_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/models/lease_agreement_model.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/notice_button_model.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class LandlordContact extends StatelessWidget {
  const LandlordContact({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<LeaseAgreementController>();
    return Obx(() {
      LeaseAgreementItem? item =
          controller.leaseAgreements.value?.data?.data?.firstOrNull;
      return controller.isLoading.value
          ? ButtonLoading()
          : item == null
          ? SizedBox()
          : Container(
              padding: EdgeInsets.all(30.76.r),
              height: 406.h,
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isDarkMode
                    ? AppColors.primaryDarkTextColor
                    : AppColors.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomTextPrimary(
                      text: 'Contact Land Lord',
                      fontSize: 24.sp,
                      color: isDarkMode
                          ? AppColors.darkAppBar
                          : AppColors.primaryColorDark,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomTextSecondary(
                    text: 'LandLord Details',
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: item.landlord?.image ?? '',
                        height: 43.58.h,
                        width: 43.58.w,
                      ),
                      SizedBox(width: 13.07.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextPrimary(
                            text: item.landlord?.name ?? '',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextSecondary(
                            text: item.landlord?.phone ?? '',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomTextSecondary(
                    text:
                        'A landlord is an individual or entity that owns property and rents it out to tenants. They are responsible for maintaining the property.',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 9.h),
                  CustomTextSecondary(
                    text: 'Lease Duration',
                    fontWeight: FontWeight.w400,
                    color: isDarkMode
                        ? AppColors.darkSecondaryText
                        : AppColors.lightText,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextSecondary(
                    text: (item.endDate).toDMMMyyyy().replaceAll(',', ''),
                    color: isDarkMode
                        ? AppColors.darkSecondaryText
                        : AppColors.darkContainer,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NoticeButtonModel(
                        onTap: () async {
                          if (item.landlord?.phone == null) {
                            ErrorSnackbar.show(
                              description: "Phone number is not available",
                            );
                          } else {
                            await URLService.launchDialpad(
                              phone: item.landlord?.phone ?? '',
                            );
                          }
                        },
                        icon: IconsPath.dashboardCall,
                        text: 'Call',
                        iconColor: isDarkMode ? AppColors.whiteColor : null,
                      ),
                      SizedBox(width: 12.w),
                      Get.find<CreateChatController>().isLoading.value
                          ? ButtonLoading()
                          : NoticeButtonModel(
                              onTap: () async {
                                final createChatController =
                                    Get.find<CreateChatController>();
                                await createChatController.getCreateChat(
                                  otherUserID: item.landlord?.id ?? 0,
                                );
                              },
                              icon: IconsPath.dashboardChat,
                              text: 'Chat',
                            ),
                    ],
                  ),
                ],
              ),
            );
    });
  }
}
