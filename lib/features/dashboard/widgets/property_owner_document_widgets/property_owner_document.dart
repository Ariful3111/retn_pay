import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_submit_document.dart.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_image.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_property.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_upload.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PropertyOwnerDocument
    extends GetView<PropertyManagementDocumentController> {
  const PropertyOwnerDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: AddNewPropertyContainer(
        child: Column(
          children: [
            CustomTextPrimary(
              text: 'Property Ownership Documents',
              fontSize: 22.sp,
            ),
            SizedBox(height: 20.h),
            CustomTextPrimary(
              text: 'Land Data Registry Certificate',
              fontSize: 20.sp,
              color: AppColors.primaryColorDark,
            ),
            SizedBox(height: 12.h),
            Obx(
              () => controller.isLoading.value
                  ? ButtonLoading()
                  : PropertyOwnerDocumentUpload(
                      key: ValueKey(controller.landImage.length),
                      onTap: () async {
                        await controller.submitDocument(
                          documentType: "ownership_certificate",
                          images: controller.landImage,
                        );
                      },
                      child: PropertyOwnerDocumentImage(
                        onPickImage: () async {
                          await UploadImage.pickMultipleImage(
                            allImages: controller.landImage,
                          );
                        },
                        image: controller.landImage,
                      ),
                    ),
            ),
            SizedBox(height: 24.h),
            CustomTextPrimary(
              text: 'Certificate of Landlord Insurance',
              fontSize: 20.sp,
              color: AppColors.primaryColorDark,
            ),
            SizedBox(height: 12.h),
            Obx(
              () => controller.isLoading.value
                  ? ButtonLoading()
                  : PropertyOwnerDocumentUpload(
                      key: ValueKey(controller.insuranceImage.length),
                      onTap: () async {
                        await controller.submitDocument(
                          documentType: "insurance",
                          images: controller.insuranceImage,
                        );
                      },
                      child: PropertyOwnerDocumentImage(
                        onPickImage: () async {
                          await UploadImage.pickMultipleImage(
                            allImages: controller.insuranceImage,
                          );
                        },
                        image: controller.insuranceImage,
                      ),
                    ),
            ),
            PropertyOwnerDocumentProperty(),
            SizedBox(height: 24.h),
            PropertyOwnerSubmitDocument(),
          ],
        ),
      ),
    );
  }
}
