import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_image.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_upload.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PropertyOwnerDocumentProperty
    extends GetWidget<PropertyManagementDocumentController> {
  const PropertyOwnerDocumentProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomTextPrimary(
          text: 'Electrical Compliance Certificate',
          fontSize: 20.sp,
          color: AppColors.primaryColorDark,
        ),
        SizedBox(height: 12.h),
        Obx(
          () => controller.isLoading.value
              ? ButtonLoading()
              : PropertyOwnerDocumentUpload(
                  key: ValueKey(controller.electricalImage.length),
                  onTap: () async {
                    await controller.submitDocument(
                      documentType: 'electrical_compliance',
                      images: controller.electricalImage,
                    );
                  },
                  child: PropertyOwnerDocumentImage(
                    onPickImage: () {
                      UploadImage.pickMultipleImage(
                        allImages: controller.electricalImage,
                      );
                    },
                    image: controller.electricalImage,
                  ),
                ),
        ),
        SizedBox(height: 20.h),
        CustomTextPrimary(
          text: 'Plumbing Compliance Certificate',
          fontSize: 20.sp,
          color: AppColors.primaryColorDark,
        ),
        SizedBox(height: 12.h),
        Obx(
          () => controller.isLoading.value
              ? ButtonLoading()
              : PropertyOwnerDocumentUpload(
                  key: ValueKey(controller.plumbingImage.length),
                  onTap: () async {
                    await controller.submitDocument(
                      documentType: 'plumbing_compliance',
                      images: controller.plumbingImage,
                    );
                  },
                  child: PropertyOwnerDocumentImage(
                    onPickImage: () {
                      UploadImage.pickMultipleImage(
                        allImages: controller.plumbingImage,
                      );
                    },
                    image: controller.plumbingImage,
                  ),
                ),
        ),
        SizedBox(height: 20.h),
        CustomTextPrimary(
          text: 'Owner\'s signed declaration',
          fontSize: 20.sp,
          color: AppColors.primaryColorDark,
        ),
        SizedBox(height: 12.h),
        Obx(
          () => controller.isLoading.value
              ? ButtonLoading()
              : PropertyOwnerDocumentUpload(
                  key: ValueKey(controller.signImage.length),
                  onTap: () async {
                    await controller.submitDocument(
                      documentType: 'other',
                      images: controller.signImage,
                    );
                  },
                  child: PropertyOwnerDocumentImage(
                    onPickImage: () {
                      UploadImage.pickMultipleImage(
                        allImages: controller.signImage,
                      );
                    },
                    image: controller.signImage,
                  ),
                ),
        ),
      ],
    );
  }
}
