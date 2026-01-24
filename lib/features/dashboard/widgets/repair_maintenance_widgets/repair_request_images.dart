import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/agent_repair_request/repair_request_assign.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/landlord_repair_maintenance/landlord_repair_maintenance_assign.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_service.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairRequestImages extends StatelessWidget {
  const RepairRequestImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: 'Attached Photos', fontSize: 20.sp),
        SizedBox(height: 12.h),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 6.w),
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(ImagesPath.service),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
       if (userIndex == 1||userIndex==2) CustomTextPrimary(text: 'Assigned To', fontSize: 20.sp),
       if (userIndex == 1||userIndex==2) SizedBox(height: 12.h),
        if (userIndex == 2) RepairRequestAssign(),
        if (userIndex == 1) LandlordRepairMaintenanceAssign(),
        if (userIndex == 0) RepairRequestService(),
       if (userIndex == 1||userIndex==2) SizedBox(height: 20.h),
        if (userIndex == 1||userIndex==2)CustomPrimaryButton(
          onPressed: () {},
          height: 40.h,
          width: 83.w,
          text:userIndex==2? 'Back':'Assign',
          borderRadius: BorderRadius.circular(6.r),
        ),
      ],
    );
  }
}
