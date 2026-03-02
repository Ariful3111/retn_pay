import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/create_conditional_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attached_image.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PropertyManagementConditionalReport
    extends GetWidget<PropertyManagementController> {
  const PropertyManagementConditionalReport({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final createController = Get.find<CreateConditionalReportController>();
    controller.imageList.clear();
    return SuccessDialog(
      height: 365.h,
      isBG: false,
      widget: Obx(() {
        final isLoading = homeController.isLoading.value;
        final properties =
            homeController.properties.value?.data?.data ?? const [];

        if (homeController.properties.value == null && !isLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (homeController.properties.value == null &&
                !homeController.isLoading.value) {
              homeController.getProperties();
            }
          });
        }

        final options = properties
            .map((p) {
              final title = (p.title ?? p.name ?? '').trim();
              final id = p.id;
              if (title.isEmpty) {
                return id != null ? 'Property (#$id)' : 'Property';
              }
              return id != null ? '$title (#$id)' : title;
            })
            .where((s) => s.trim().isNotEmpty)
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextPrimary(text: 'Condition Report', fontSize: 24.sp),
            SizedBox(height: 6.h),
            CustomTextPrimary(
              text: 'Upload Condition Report',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 4.88.h),
            Divider(color: AppColors.whiteBorder),
            SizedBox(height: 13.12.h),
            if (homeController.properties.value == null && isLoading)
              ButtonLoading()
            else
              CustomDropdownMenu(
                alignmentGeometry: Alignment(0.5, 1),
                offset: Offset(-70.w, 2.h),
                label: CustomTextSecondary(text: 'Selected Property'),
                textColor: AppColors.darkContainer,
                onSelect: (value) {
                  if (value == null) return;
                  controller.selectedProperty.value = value;
                  final match = RegExp(
                    r'\(#(\d+)\)',
                  ).firstMatch(value)?.group(1);
                  if (match != null) {
                    debugPrint('Selected property ID: $match');
                  }
                },
                option: options,
                isSelect: controller.selectedProperty,
              ),
            SizedBox(height: 20.h),
            CustomTextSecondary(text: 'Upload Condition Report'),
            SizedBox(height: 4.h),
            CustomAttachedImage(imageList: controller.imageList),
            SizedBox(height: 4.h),
            CustomTextSecondary(
              text: '*Only PDF files are supported (Max size: 10MB)',
              color: AppColors.primaryColorDark,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
            Spacer(),
            createController.isLoading.value
                ? ButtonLoading()
                : CustomPrimaryButton(
                    height: 52.h,
                    width: 120.w,
                    borderRadius: BorderRadius.circular(8.r),
                    text: 'Submit',
                    onPressed: () async {
                      final propertyID =
                          RegExp(r'\(#(\d+)\)')
                              .firstMatch(controller.selectedProperty.value)
                              ?.group(1) ??
                          '';
                      await createController.createConditionalReport(
                        propertyID: propertyID,
                        reportType: 'routine',
                        summary: '',
                        image: controller.imageList.isNotEmpty
                            ? File(controller.imageList.first.path)
                            : File(''),
                      );
                    },
                  ),
          ],
        );
      }),
    );
  }
}
