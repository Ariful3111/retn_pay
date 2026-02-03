import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_image.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_upload.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyOwnerDocumentProperty extends StatelessWidget {
  const PropertyOwnerDocumentProperty({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyManagementDocumentController propertyManagementDocumentController =
        Get.find();
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
          () => PropertyOwnerDocumentUpload(
            key: ValueKey(propertyManagementDocumentController.electricalImage.length),
            onTap: () {},
            child: PropertyOwnerDocumentImage(
              onPickImage: () {
                UploadImage.pickMultipleImage(
                  allImages:
                      propertyManagementDocumentController.electricalImage,
                );
              },
              image: propertyManagementDocumentController.electricalImage,
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
          () => PropertyOwnerDocumentUpload(
            key: ValueKey(propertyManagementDocumentController.plumbingImage.length),
            onTap: () {},
            child: PropertyOwnerDocumentImage(
              onPickImage: () {
                UploadImage.pickMultipleImage(
                  allImages: propertyManagementDocumentController.plumbingImage,
                );
              },
              image: propertyManagementDocumentController.plumbingImage,
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
          () => PropertyOwnerDocumentUpload(
            key: ValueKey(propertyManagementDocumentController.signImage.length),
            onTap: () {},
            child: PropertyOwnerDocumentImage(
              onPickImage: () {
                UploadImage.pickMultipleImage(
                  allImages: propertyManagementDocumentController.signImage,
                );
              },
              image: propertyManagementDocumentController.signImage,
            ),
          ),
        ),
      ],
    );
  }
}
