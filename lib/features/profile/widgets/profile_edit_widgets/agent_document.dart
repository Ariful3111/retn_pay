import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';

class AgentDocument extends GetWidget<ProfileController> {
  const AgentDocument({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextSecondary(
              text: 'Documents',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          Obx(() {
            final documents =
                controller.profileData.value?.data?.documents ?? [];
            if (documents.isEmpty) {
              return CustomTextSecondary(text: 'No documents uploaded');
            }

            return Column(
              children: List.generate(documents.length, (index) {
                final doc = documents[index];
                return Column(
                  children: [
                    CustomTextSecondary(
                      text: '${doc.documentType?.toUpperCase() ?? 'Document'}:',
                    ),
                    SizedBox(height: 12.h),
                    CustomDottedBorder(
                      height: 175.h,
                      width: 310.w,
                      borderRadius: 12.r,
                      image: CachedNetworkImageProvider(
                        doc.fileUrl ?? ImagesPath.document,
                      ),
                    ),
                    if (index < documents.length - 1) SizedBox(height: 48.h),
                  ],
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
