import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/inspection_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordInspectionViewId extends GetWidget<InspectionDetailsController> {
  const LandlordInspectionViewId({super.key});

  @override
  Widget build(BuildContext context) {
    final documents =
        controller.inspectionDetails.value?.data?.tenant?.documents;
    final frontImageUrl = documents?.isNotEmpty == true
        ? documents!.first.fileUrl
        : null;
    final backImageUrl = documents?.isNotEmpty == true
        ? documents!.first.backFileUrl
        : null;
    final documentType = documents?.isNotEmpty == true
        ? documents!.first.documentType
        : 'ID';

    String getDocumentTitle(String? type) {
      switch (type) {
        case 'nid':
          return 'National ID Details';
        case 'passport':
          return 'Passport Details';
        case 'driving_license':
          return 'Driving License Details';
        default:
          return 'ID/Passport/Driving License Details';
      }
    }

    return LandlordInspectionViewContainer(
      child: Column(
        children: [
          CustomTextSecondary(
            text: getDocumentTitle(documentType),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.h),
          if (frontImageUrl != null || backImageUrl != null)
            _buildDocumentImages(frontImageUrl, backImageUrl)
          else
            Container(
              height: 200.h,
              width: 320.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[200],
              ),
              child: Center(
                child: CustomTextSecondary(
                  text: 'No documents available',
                  fontSize: 14.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDocumentImages(String? frontUrl, String? backUrl) {
    return Column(
      children: [
        if (frontUrl != null) _buildDocumentCard(frontUrl, 'Front Side'),
        if (frontUrl != null && backUrl != null) SizedBox(height: 16.h),
        if (backUrl != null) _buildDocumentCard(backUrl, 'Back Side'),
      ],
    );
  }

  Widget _buildDocumentCard(String? imageUrl, String label) {
    return Column(
      children: [
        CustomTextSecondary(
          text: label,
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
        SizedBox(height: 8.h),
        Container(
          height: 200.h,
          width: 320.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[200],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[200],
              child: Image.asset(ImagesPath.document, fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
