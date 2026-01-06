import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_field.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_upload.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyOwnerDocument extends StatelessWidget {
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
            PropertyOwnerDocumentUpload(
              onPickImage: () {},
              image: ImagesPath.office,
              imageName: 'Your Image Name.jpg',
              onUpload: () {},
              onOkImage: () {},
              onRemoveImage: () {},
            ),
            SizedBox(height: 24.h),
            CustomTextPrimary(
              text: 'Certificate of Landlord Insurance',
              fontSize: 20.sp,
              color: AppColors.primaryColorDark,
            ),
            SizedBox(height: 12.h),
            PropertyOwnerDocumentUpload(
              onPickImage: () {},
              image: ImagesPath.office,
              imageName: 'Your Image Name.jpg',
              onUpload: () {},
              onOkImage: () {},
              onRemoveImage: () {},
            ),
            SizedBox(height: 24.h),
            PropertyOwnerDocumentField()
          ],
        ),
      ),
    );
  }
}
