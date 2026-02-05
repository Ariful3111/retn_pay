import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_button.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_field.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_images.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_upload_image.dart';

class AddNewPropertyInfo extends GetWidget<AddNewPropertyController> {
  const AddNewPropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNewPropertyContainer(
      child: Column(
        children: [
          AddNewPropertyUploadImage(
            onTap: () async {
              await UploadImage.pickMultipleImage(allImages: controller.images);
            },
            isTitle: true,
          ),
          SizedBox(height: 12.h),
          AddNewPropertyInfoField(
            maxLine: 5,
            isAlignLabelWithHint: true,
            controller: controller.imageDescriptionController,
            label: 'Image Description',
          ),
          SizedBox(height: 12.h),
          AddNewPropertyInfoButton(onAdd: () {}, onUpload: () {}),
          SizedBox(height: 20.h),
          AddNewPropertyInfoImages(),
        ],
      ),
    );
  }
}
