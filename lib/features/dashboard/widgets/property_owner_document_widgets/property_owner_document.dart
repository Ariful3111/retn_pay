import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_field.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_image.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_property.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_upload.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyOwnerDocument extends StatelessWidget {
  const PropertyOwnerDocument({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyManagementDocumentController propertyManagementDocumentController =
        Get.find();
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
              () => PropertyOwnerDocumentUpload(
                key: ValueKey(propertyManagementDocumentController.landImage.length),
                onTap: () {},
                child: PropertyOwnerDocumentImage(
                  onPickImage: () {
                    UploadImage.pickMultipleImage(
                      allImages: propertyManagementDocumentController.landImage,
                    );
                  },
                  image: propertyManagementDocumentController.landImage,
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
              () => PropertyOwnerDocumentUpload(
                key: ValueKey(propertyManagementDocumentController.insuranceImage.length),
                onTap: () {},
                child: PropertyOwnerDocumentImage(
                  onPickImage: () {
                    UploadImage.pickMultipleImage(
                      allImages:
                          propertyManagementDocumentController.insuranceImage,
                    );
                  },
                  image: propertyManagementDocumentController.insuranceImage,
                ),
              ),
            ),
            PropertyOwnerDocumentProperty(),
            SizedBox(height: 24.h),
            PropertyOwnerDocumentField(),
          ],
        ),
      ),
    );
  }
}
