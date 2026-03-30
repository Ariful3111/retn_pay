import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_application.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_current_employment.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_employment.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_pets.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_previous_employment.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_references.dart';
class ApplicationManagementDetailsPartE
    extends StatelessWidget {
  const ApplicationManagementDetailsPartE({super.key});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ApplicationManagementDetailsPartEApplication(),
        SizedBox(height: 20.h),
        ApplicationManagementDetailsPartEProvider(),
        SizedBox(height: 20.h),
        ApplicationManagementDetailsPartEEmployment(),
        SizedBox(height: 20.h),
        ApplicationManagementDetailsPartECurrentEmployment(),
        SizedBox(height: 20.h,),
        ApplicationManagementDetailsPartEPreviousEmployment(),
        SizedBox(height: 20.h,),
        ApplicationManagementDetailsPartEReferences(),
        SizedBox(height: 20.h,),
        ApplicationManagementDetailsPetsDeclaration(),
      ],
    );
  }
  
  
}
