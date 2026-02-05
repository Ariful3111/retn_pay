import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_address.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_data.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_details.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_dialog.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_features.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_inspection.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_virtual_tour.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/property_maintenance_info.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class AddNewProperty extends GetView<AddNewPropertyController> {
  const AddNewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? Center(child: ButtonLoading())
          : Column(
              children: [
                AddNewPropertyInfo(),
                SizedBox(height: 20.h),
                AddNewPropertyData(),
                SizedBox(height: 20.h),
                AddNewPropertyAddress(),
                SizedBox(height: 20.h),
                AddNewPropertyDetails(),
                SizedBox(height: 20.h),
                AddNewPropertyInspection(),
                SizedBox(height: 20.h),
                AddNewPropertyContainer(
                  child: CustomDropdownMenu(
                    alignmentGeometry: Alignment(0.2, 1),
                    onSelect: (value) {
                      controller.selectedAgent.value = value!;
                    },
                    option: controller.agentList,
                    isSelect: controller.selectedAgent,
                    label: CustomTextSecondary(text: 'Assign Agent'),
                  ),
                ),
                SizedBox(height: 20.h),
                PropertyMaintenanceInfo(),
                SizedBox(height: 20.h),
                AddNewPropertyFeatures(),

                Obx(() {
                  return controller.inspectionChecked[1] == true
                      ? SizedBox(height: 20.h)
                      : SizedBox.shrink();
                }),
                Obx(() {
                  return controller.inspectionChecked[1] == true
                      ? AddNewPropertyVirtualTour()
                      : SizedBox.shrink();
                }),
                SizedBox(height: 24.h),
                CustomPrimaryButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddNewPropertyDialog();
                      },
                    );
                  },
                  height: 52.h,
                  width: 180.w,
                  borderRadius: BorderRadius.circular(8.r),
                  text: 'Submit',
                ),
              ],
            );
    });
  }
}
