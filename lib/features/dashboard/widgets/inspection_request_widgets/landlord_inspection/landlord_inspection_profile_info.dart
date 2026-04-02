import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/inspection_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordInspectionProfileInfo
    extends GetWidget<InspectionDetailsController> {
  const LandlordInspectionProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final tenant = controller.inspectionDetails.value?.data?.tenant;
    final profileImage = tenant?.image ?? '';
    final tenantName = tenant?.name ?? 'N/A';

    return LandlordInspectionViewContainer(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: 32.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: 'Profile Information',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Container(
                height: 74.h,
                width: 74.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: profileImage.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: profileImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset(ImagesPath.profile, fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            Image.asset(ImagesPath.profile, fit: BoxFit.cover),
                      )
                    : Image.asset(ImagesPath.profile, fit: BoxFit.cover),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPrimary(
                    text: tenantName,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextPrimary(
                    text: 'Tenant',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
