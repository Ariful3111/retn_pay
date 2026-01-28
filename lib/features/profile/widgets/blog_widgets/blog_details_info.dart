import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/blog_details_controller.dart';
import 'package:renter_pay/shared/extensions/Extractors/content_extractor.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BlogDetailsInfo extends GetWidget<BlogDetailsController> {
  const BlogDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final blocks =
        controller.blogDetails.value?.data?.content
            ?.extractBlogContentBlocks() ??
        [];
    if (blocks.isEmpty) return const SizedBox.shrink();

    final children = <Widget>[SizedBox(height: 16.h)];
    for (final block in blocks) {
      switch (block.type) {
        case BlogContentBlockType.heading:
          children.add(CustomTextPrimary(text: block.text, fontSize: 20.sp));
          children.add(SizedBox(height: 12.h));
          break;
        case BlogContentBlockType.paragraph:
          children.add(CustomTextSecondary(text: block.text));
          children.add(SizedBox(height: 12.h));
          break;
        case BlogContentBlockType.bullet:
          children.add(info(block.text));
          break;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget info(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.secondaryTextColor,
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(child: CustomTextSecondary(text: text)),
      ],
    );
  }
}
