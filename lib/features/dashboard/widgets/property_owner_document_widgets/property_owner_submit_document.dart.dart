import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';

class PropertyOwnerSubmitDocument
    extends GetWidget<PropertyManagementDocumentController> {
  const PropertyOwnerSubmitDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPrimaryButton(
        onPressed: () async {
          await controller.openDialog(context: context);
        },
        text: 'Complete',
        height: 52.h,
        width: 119.w,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
